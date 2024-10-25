///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-24 17:28:53
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-25 15:01:11
/// @FilePath: /flutter_flexible/lib/pages/app_main/product_publish/component/dialog_species_selection.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:flutter/material.dart';
import 'package:flutter_flexible/components/index.dart';
import 'package:flutter_flexible/constants/themes/td_colors_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DialogSpeciesSelection extends StatefulWidget {
  const DialogSpeciesSelection({super.key, this.hasNext = false});

  final bool hasNext;

  @override
  State<DialogSpeciesSelection> createState() => _DialogSpeciesSelectionState();
}

class _DialogSpeciesSelectionState extends State<DialogSpeciesSelection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 0.88.sh,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "请选择品类/品牌/系列等商品信息",
                    style: TextStyle(
                      color: TDTheme.of(context).fontBlackColor10,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    DialogUtils.dismiss();
                  },
                  icon: const Icon(Icons.close),
                )
              ],
            ),
          ),
          Container(
            height: 40.h,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            width: double.infinity,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 12.w),
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: TDTheme.of(context).grayColor15,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text("品类$index",
                    style: TextStyle(
                      color: TDTheme.of(context).fontBlackColor10,
                      fontWeight: FontWeight.normal,
                      fontSize: 13.sp,
                    )),
              ),
              itemCount: 100,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 94.w,
                  height: double.infinity,
                  color: TDTheme.of(context).grayColor6,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Container(
                        alignment: Alignment.center,
                        height: 40.h,
                        child: Text("品牌$index",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.normal,
                              color: TDTheme.of(context).fontBlackColor10,
                            )),
                      ),
                      shrinkWrap: true,
                      itemCount: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.w, vertical: 6.h),
                          height: 40.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("类目$index",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          TDTheme.of(context).fontBlackColor10,
                                    )),
                              ),
                              Icon(
                                Icons.check,
                                color: TDTheme.of(context).brandColor7,
                                size: 22.r,
                              )
                            ],
                          ),
                        ),
                        itemCount: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Expanded(
                  child: TDButton(
                    isBlock: true,
                    shape: TDButtonShape.circle,
                    type: TDButtonType.fill,
                    text: "重置",
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                    child: TDButton(
                  isBlock: true,
                  type: TDButtonType.fill,
                  shape: TDButtonShape.circle,
                  theme: TDButtonTheme.primary,
                  text: widget.hasNext ? "下一步" : "确定",
                  onTap: () {},
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
