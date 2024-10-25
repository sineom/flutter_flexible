///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-23 16:45:49
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-25 15:31:06
/// @FilePath: /flutter_flexible/lib/pages/app_main/product_publish/porduct_publish_sell_page.dart
/// @Description:出售商品的发布
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/components/common_appbar.dart';
import 'package:flutter_flexible/constants/themes/td_colors_ext.dart';
import 'package:flutter_flexible/pages/app_main/home/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../../components/index.dart';
import 'component/dialog_attr_selection.dart';
import 'component/dialog_species_selection.dart';
import 'component/product_image_component.dart';
import 'provider/product_publish.p.dart';

@RoutePage()
class ProductPublishSellPage extends StatefulWidget {
  const ProductPublishSellPage({super.key});

  @override
  State<ProductPublishSellPage> createState() => _ProductPublishSellPageState();
}

class _ProductPublishSellPageState extends State<ProductPublishSellPage> {
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
                  const ProductImageComponent("sell"),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              color: Colors.white,
              child: TDButton(
                text: "发布",
                type: TDButtonType.fill,
                shape: TDButtonShape.circle,
                theme: TDButtonTheme.primary,
                isBlock: true,
                onTap: () {},
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "商品分类",
            style: TextStyle(
                fontSize: 12.sp, color: TDTheme.of(context).fontBlackColor1),
          ),
          SizedBox(
            height: 8.h,
          ),
          GestureDetector(
            onTap: () {
              DialogUtils.showDialog(
                  builder: (context) => const DialogSpeciesSelection(),
                  // builder: (context) => const DialogAttrSelection(),
                  alignment: Alignment.bottomCenter);
            },
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "请选择品类/品牌/系列等商品信息",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: TDTheme.of(context).fontBlackColor10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 14.sp, color: TDTheme.of(context).fontBlackColor10),
              ],
            ),
          ),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "商品描述",
            style: TextStyle(
                fontSize: 12.sp, color: TDTheme.of(context).fontBlackColor1),
          ),
          SizedBox(
            height: 8.h,
          ),
          TDTextarea(
            maxLines: 4,
            minLines: 4,
            maxLength: 1000,
            hintText: "请描述商品具体信息",
            textStyle: TextStyle(
                fontSize: 14.sp,
                color: TDTheme.of(context).fontBlackColor10,
                fontWeight: FontWeight.bold),
            hintTextStyle: TextStyle(
                fontSize: 14.sp,
                color: TDTheme.of(context).fontBlackColor10,
                fontWeight: FontWeight.bold),
            indicator: true,
            layout: TDTextareaLayout.vertical,
            onChanged: (value) {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
