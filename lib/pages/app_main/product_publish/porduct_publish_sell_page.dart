///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-23 16:45:49
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-24 18:59:06
/// @FilePath: /flutter_flexible/lib/pages/app_main/product_publish/porduct_publish_sell_page.dart
/// @Description:出售商品的发布
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/components/common_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moon_design/moon_design.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../../components/image/index.dart';
import '../../../components/index.dart';
import 'component/dialog_species_selection.dart';
import 'provider/product_publish.p.dart';

@RoutePage()
class PorductPublishSellPage extends StatefulWidget {
  const PorductPublishSellPage({super.key});

  @override
  State<PorductPublishSellPage> createState() => _PorductPublishSellPageState();
}

class _PorductPublishSellPageState extends State<PorductPublishSellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        title: "出售商品",
      ),
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _productCategory(),
                  _productDescription(),
                  _productImage(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              color: context.moonColors!.goku,
              child: MoonFilledButton(
                label: Text("发布"),
                onTap: () {},
                isFullWidth: true,
                borderRadius: BorderRadius.circular(16.r),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 商品分类
  Widget _productCategory() {
    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(top: 12.h),
      decoration: BoxDecoration(
        color: context.moonColors!.goku,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "商品分类",
            style:
                TextStyle(fontSize: 12.sp, color: context.moonColors!.frieza60),
          ),
          SizedBox(
            height: 8.h,
          ),
          MoonMenuItem(
            label: Text(
              "请选择品类/品牌/系列等商品信息",
              style: TextStyle(
                  fontSize: 14.sp, color: context.moonColors!.textSecondary),
            ),
            onTap: () {
              DialogUtils.showDialog(
                  builder: (context) => const DialogSpeciesSelection(),
                  alignment: Alignment.bottomCenter);
            },
            trailing: Icon(
              Icons.chevron_right,
              color: context.moonColors!.frieza60,
            ),
          )
        ],
      ),
    );
  }

  /// 商品描述
  Widget _productDescription() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.moonColors!.goku,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "商品描述",
            style:
                TextStyle(fontSize: 12.sp, color: context.moonColors!.frieza60),
          ),
          SizedBox(
            height: 8.h,
          ),
          MoonTextArea(
            height: 200.h,
            hintText: "请描述商品具体信息",
            textColor: context.moonColors!.textSecondary,
            textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: context.moonColors!.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  /// 商品图片的选择
  Widget _productImage() {
    return Consumer(
      builder: (context, ref, child) {
        final album = ref.watch(albumProvider("sell"));
        return Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: context.moonColors!.goku,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "商品图片",
                style: TextStyle(
                    fontSize: 12.sp, color: context.moonColors!.frieza60),
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
                                .selectAlbum(context,
                                    pickerConfig: pickerConfig);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.moonColors!.frieza10,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Center(
                              child: Icon(Icons.add,
                                  color: context.moonColors!.textSecondary),
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
                                  resource: (await e.file)?.path ?? "",
                                  imageType: ImageSourceType.asset))
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
      },
    );
  }
}
