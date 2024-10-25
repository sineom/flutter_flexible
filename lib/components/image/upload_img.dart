import 'package:flutter/material.dart';
import 'package:flutter_flexible/constants/themes/td_colors_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'extended_img.dart';
import 'grallery/gallery_item.m.dart';
import 'grallery/image_view_gallery.dart';

class UploadImg extends StatelessWidget {
  /// 图片的地址
  final String? url;

  /// 图片的来源类型，默认是网络图片
  final ImageSourceType? imageType;

  /// 图片的宽度
  final double? width;

  /// 图片的高度
  final double? height;

  /// 删除图片的回调
  final VoidCallback onDelete;

  /// 图片预览的回调
  final VoidCallback? onPreview;

  /// 图片预览的组件
  final Widget? previewWidget;

  final BorderRadius? borderRadius;

  /// The image to display.
  final ImageProvider? image;

  /// 图片的适配方式
  final BoxFit fit;

  const UploadImg(
      {super.key,
      this.url,
      this.imageType,
      required this.onDelete,
      this.width,
      this.height,
      required this.onPreview,
      this.previewWidget,
      this.borderRadius,
      this.image,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            // 预览图片的逻辑
            if (onPreview != null) {
              onPreview!();
            } else {
              if (url != null && imageType != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewGallery(
                      galleryItems: [
                        GalleryItem(
                            id: url!, resource: url!, imageType: imageType!)
                      ],
                      backgroundDecoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: TDTheme.of(context).grayColor6,
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.all(5.r),
            margin: EdgeInsets.all(10.r),
            child: previewWidget ??
                ExtendedImg(
                  image: image,
                  imageUrl: url,
                  sourceType: imageType,
                  width: width,
                  height: height,
                  fit: fit,
                  borderRadius: borderRadius,
                ),
          ),
        ),
        Positioned(
          top: 4.r,
          right: 4.r,
          child: GestureDetector(
            onTap: () {
              // 删除图片的逻辑
              onDelete();
            },
            child: Container(
              padding: EdgeInsets.all(2.r),
              decoration: BoxDecoration(
                color: TDTheme.of(context).grayColor16,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20.r,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
