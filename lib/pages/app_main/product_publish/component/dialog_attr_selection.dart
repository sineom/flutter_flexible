import 'package:flutter/material.dart';
import 'package:flutter_flexible/components/dialog/dialog_utils.dart';
import 'package:flutter_flexible/constants/themes/td_colors_ext.dart';
import 'package:flutter_flexible/pages/app_main/home/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// @LastEditTime: 2024-10-24 19:27:28
/// @FilePath: /flutter_flexible/lib/pages/app_main/product_publish/component/dialog_attr_selection.dart
/// @Description: 属性选择器
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///

class DialogAttrSelection extends StatefulWidget {
  const DialogAttrSelection({super.key});

  @override
  State<DialogAttrSelection> createState() => _DialogAttrSelectionState();
}

class _DialogAttrSelectionState extends State<DialogAttrSelection> {
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
                    "属性/等级",
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
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.separated(
                  itemBuilder: (ctx, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("属性$index",
                                style: TextStyle(
                                    color: TDTheme.of(context).fontBlackColor1,
                                    fontSize: 13.sp)),
                            Container(
                              height: 40.h,
                              margin: EdgeInsets.only(top: 12.h),
                              width: double.infinity,
                              child: MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                removeLeft: true,
                                removeRight: true,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: 12.w),
                                  itemBuilder: (context, index) => Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 4.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: TDTheme.of(context).grayColor15,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Text("品类$index",
                                        style: TextStyle(
                                          color: TDTheme.of(context)
                                              .fontBlackColor10,
                                          fontSize: 13.sp,
                                        )),
                                  ),
                                  itemCount: 100,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (ctx, index) => SizedBox(
                        height: 12.h,
                      ),
                  itemCount: 20),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Expanded(
                  child: TDButton(
                    isBlock: true,
                    text: "重置",
                    shape: TDButtonShape.circle,
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: TDButton(
                    text: "确定",
                    shape: TDButtonShape.circle,
                    theme: TDButtonTheme.primary,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
