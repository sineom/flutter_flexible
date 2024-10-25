import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/components/dialog/dialog_utils.dart';
import 'package:flutter_flexible/constants/themes/td_colors_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../components/common_appbar.dart';
import 'component/dialog_attr_selection.dart';
import 'component/dialog_species_selection.dart';

@RoutePage()
class ProductPublishBuyPage extends StatefulWidget {
  const ProductPublishBuyPage({super.key});

  @override
  State<ProductPublishBuyPage> createState() => _ProductPublishBuyPageState();
}

class _ProductPublishBuyPageState extends State<ProductPublishBuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        title: "求购商品",
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
                  SizedBox(
                    height: 12.h,
                  ),
                  TDInput(
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
                ],
              ),
            ),
            Container(
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
