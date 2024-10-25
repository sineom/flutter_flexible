///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-25 16:50:39
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-25 18:06:51
/// @FilePath: /flutter_flexible/lib/pages/app_main/home/sell/home_tab_sell_page.dart
/// @Description: 首页的出售tab
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:flutter/material.dart';
import 'package:flutter_flexible/components/index.dart';
import 'package:flutter_flexible/constants/themes/td_colors_ext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'dialog_category.dart';

class HomeTabSellPage extends ConsumerStatefulWidget {
  const HomeTabSellPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeTabSellState();
}

class _HomeTabSellState extends ConsumerState<HomeTabSellPage> {
  /// 国家与地区是否展开
  bool _isExpandedCountry = false;

  /// 品类/品牌/系列是否展开
  bool _isExpandedCategory = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.5.w),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpandedCategory = false;
                    _isExpandedCountry = !_isExpandedCountry;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "国家与地区",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      AnimatedRotation(
                        turns: _isExpandedCountry ? 0.5 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 24,
                          color: TDTheme.of(context).grayColor9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 24.w,
              ),
              Expanded(
                child: Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      DialogUtils.showAttach(
                        targetContext: context,
                        builder: (ctx) => DialogCategory(),
                        maskColor: Colors.transparent,
                        onDismiss: () {
                          setState(() {
                            _isExpandedCategory = !_isExpandedCategory;
                          });
                        },
                      );
                      setState(() {
                        _isExpandedCountry = false;
                        _isExpandedCategory = !_isExpandedCategory;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "品类/品牌/系列",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          AnimatedRotation(
                            turns: _isExpandedCategory ? 0.5 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 24,
                              color: TDTheme.of(context).grayColor9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
