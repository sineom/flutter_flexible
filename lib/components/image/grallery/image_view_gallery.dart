import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/components/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../extended_img.dart';
import 'gallery_item.m.dart';

///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-24 14:55:00
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-24 15:15:30
/// @FilePath: /flutter_flexible/lib/components/image/image_view_gallery.dart
/// @Description:  图片预览组件
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
class ImageViewGallery extends StatefulWidget {
  ImageViewGallery({
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale = 0.5,
    this.maxScale = 4.1,
    this.initialIndex = 0,
    required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<GalleryItem> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _ImageViewGalleryState();
  }
}

class _ImageViewGalleryState extends State<ImageViewGallery> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: widget.backgroundDecoration,
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: _buildItem,
                  itemCount: widget.galleryItems.length,
                  loadingBuilder: widget.loadingBuilder ??
                      (context, event) => Center(
                            child: SizedBox(
                              width: 20.w,
                              height: 20.w,
                              child: const TDLoading(
                                size: TDLoadingSize.medium,
                              ),
                            ),
                          ),
                  backgroundDecoration: widget.backgroundDecoration,
                  pageController: widget.pageController,
                  onPageChanged: onPageChanged,
                  scrollDirection: widget.scrollDirection,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100.h,
            child: CommonAppbar(
              titleWidget: Text(
                "${currentIndex + 1}/${widget.galleryItems.length}",
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
              ),
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final GalleryItem item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: getImageProvider(item),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id),
    );
  }

  /// 根据图片的类型获取不同的图片提供者
  ImageProvider getImageProvider(GalleryItem item) {
    if (item.asset != null) {
      return AssetEntityImageProvider(item.asset!);
    }
    if (item.resource == null) {
      throw Exception("图片资源不存在");
    }
    if (item.imageType == ImageSourceType.network) {
      return ExtendedNetworkImageProvider(item.resource!);
    } else if (item.imageType == ImageSourceType.asset) {
      return AssetImage(item.resource!);
    } else {
      return ExtendedFileImageProvider(File(item.resource!));
    }
  }
}
