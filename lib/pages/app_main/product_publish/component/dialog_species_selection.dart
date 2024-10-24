///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-24 17:28:53
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-24 18:58:10
/// @FilePath: /flutter_flexible/lib/pages/app_main/product_publish/component/dialog_species_selection.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:flutter/material.dart';
import 'package:flutter_flexible/components/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moon_design/moon_design.dart';

class DialogSpeciesSelection extends StatefulWidget {
  const DialogSpeciesSelection({super.key});

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
                      color: context.moonColors!.textSecondary,
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
                  color: context.moonColors!.frieza10,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text("品类$index",
                    style: TextStyle(
                      color: context.moonColors!.textSecondary,
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
                  color: context.moonColors!.gohan,
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
                              color: context.moonColors!.textSecondary,
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
                    color: context.moonColors!.goku,
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
                                      color: context.moonColors!.textSecondary,
                                    )),
                              ),
                              Icon(
                                Icons.check,
                                color: context.moonColors!.piccolo,
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
          )
        ],
      ),
    );
  }
}
