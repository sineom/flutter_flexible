///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-25 15:26:24
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-25 15:57:12
/// @FilePath: /flutter_flexible/lib/pages/app_main/product_publish/component/product_image_component.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:flutter/material.dart';
import 'package:flutter_flexible/constants/themes/td_colors_ext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../../../components/index.dart';
import '../provider/product_publish.p.dart';

class ProductImageComponent extends ConsumerStatefulWidget {
  const ProductImageComponent(this.id, {super.key});

  final String id;


  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductImageComponentState();
}

class _ProductImageComponentState extends ConsumerState<ProductImageComponent> {
  @override
  Widget build(BuildContext context) {
    final album = ref.watch(albumProvider(widget.id));
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "商品图片",
            style: TextStyle(
                fontSize: 12.sp, color: TDTheme.of(context).fontBlackColor1),
          ),
          SizedBox(
            height: 13.h,
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0.0.r,
                mainAxisSpacing: 0.0.r,
              ),
              itemCount: album.length + 1, // 九宫格展示 + 1 个添加图片的占位组件
              itemBuilder: (context, index) {
                /// 如果长度小于9，则展示添加图片的占位组件，否则不展示
                if (index == album.length) {
                  if (album.length < 9) {
                    return GestureDetector(
                      onTap: () async {
                        // 添加图片的逻辑
                        final pickerConfig = AssetPickerConfig(
                          maxAssets: 9,
                          selectedAssets: album,
                        );
                        ref
                            .read(albumProvider("sell").notifier)
                            .selectAlbum(context, pickerConfig: pickerConfig);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: TDTheme.of(context).grayColor6,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Center(
                          child: Icon(Icons.add,
                              color: TDTheme.of(context).fontGyColor2),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                } else {
                  final asset = album[index];

                  return UploadImg(
                    image: AssetEntityImageProvider(asset),
                    width: 96.r,
                    height: 96.r,
                    imageType: ImageSourceType.network,
                    onDelete: () {
                      // 删除图片的逻辑
                      ref
                          .read(albumProvider("sell").notifier)
                          .deletePhotoByIndex(index);
                    },
                    onPreview: () async {
                      // 预览图片的逻辑
                      final galleryItems = await Future.wait(album
                          .map((e) async => GalleryItem(
                              id: e.id,
                             asset: e))
                          .toList());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageViewGallery(
                            galleryItems: galleryItems,
                            backgroundDecoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
