import 'package:flutter/material.dart';
import 'package:flutter_flexible/constants/themes/td_colors_ext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DialogCategory extends ConsumerStatefulWidget {
  const DialogCategory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DialogCategoryState();
}

class _DialogCategoryState extends ConsumerState<DialogCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 0.6.sh,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(12.r),
            height: 34.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  margin: EdgeInsets.only(left: 12.w),
                  decoration: BoxDecoration(
                    color: TDTheme.of(context).grayColor6,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    "品类/品牌/系列 $index",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: TDTheme.of(context).fontBlackColor10),
                  ),
                );
              },
            ),
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
                  text: "确定",
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
