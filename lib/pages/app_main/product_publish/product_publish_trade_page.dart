///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-25 15:21:51
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-25 16:30:02
/// @FilePath: /flutter_flexible/lib/pages/app_main/product_publish/product_publish_trade_page.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/components/dialog/dialog_utils.dart';
import 'package:flutter_flexible/constants/themes/td_colors_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../components/common_appbar.dart';
import 'component/dialog_species_selection.dart';
import 'component/product_image_component.dart';

@RoutePage()
class ProductPublishTradePage extends StatefulWidget {
  const ProductPublishTradePage({super.key});

  @override
  State<ProductPublishTradePage> createState() =>
      _ProductPublishTradePageState();
}

class _ProductPublishTradePageState extends State<ProductPublishTradePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        title: "交易市场出售",
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
                  const ProductImageComponent("trade"),
                  TDInput(
                    required: true,
                    leftLabel: "数量",
                    hintText: "请输入数量",
                    contentAlignment: TextAlign.end,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    showBottomDivider: false,
                    rightBtn: Icon(Icons.arrow_forward_ios,
                        size: 14.sp,
                        color: TDTheme.of(context).fontBlackColor1),
                    onChanged: (value) {},
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12.h),
                    child: TDInput(
                      required: true,
                      leftLabel: "单价(RMB）",
                      hintText: "请输入单价",
                      contentAlignment: TextAlign.end,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      showBottomDivider: false,
                      rightBtn: Icon(Icons.arrow_forward_ios,
                          size: 14.sp,
                          color: TDTheme.of(context).fontBlackColor1),
                      onChanged: (value) {},
                    ),
                  ),
                  TDInput(
                    required: true,
                    leftLabel: "发货方式",
                    readOnly: true,
                    hintText: "请输入选择发货方式",
                    contentAlignment: TextAlign.end,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    showBottomDivider: false,
                    rightBtn: Icon(Icons.arrow_forward_ios,
                        size: 14.sp,
                        color: TDTheme.of(context).fontBlackColor1),
                    onChanged: (value) {},
                  ),
                  Container(
                    padding: EdgeInsets.all(16.r),
                    margin: EdgeInsets.only(top: 12.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "注意事项",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: TDTheme.of(context).fontBlackColor10,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "1、平台只支持担保交易，担保交易将收取买卖双方0.5%续费。\n2、买家确定收货后货款将打入卖家账户中。",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: TDTheme.of(context).fontBlackColor9,
                              height: 1.8),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              color: Colors.white,
              child: TDButton(
                text: "发布",
                isBlock: true,
                shape: TDButtonShape.circle,
                theme: TDButtonTheme.primary,
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
            maxLines: 20,
            minLines: 4,
            maxLength: 1000,
            padding: EdgeInsets.zero,
            hintText: "请描述商品具体信息",
            textStyle: TextStyle(
                fontSize: 14.sp,
                color: TDTheme.of(context).fontBlackColor10,
                fontWeight: FontWeight.bold),
            hintTextStyle: TextStyle(
                fontSize: 14.sp,
                color: TDTheme.of(context).fontBlackColor10,
                fontWeight: FontWeight.bold),
            indicator: false,
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
