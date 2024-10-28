///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-25 16:50:39
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-28 14:37:32
/// @FilePath: /flutter_flexible/lib/pages/app_main/home/sell/home_tab_sell_page.dart
/// @Description: 首页的出售tab
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/components/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'dialog_category.dart';
import 'dialog_country.dart';
import 'tab_sell_item_component.dart';

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
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 11.5.w),
      child: Column(
        children: [
          Row(
            children: [
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpandedCategory = false;
                      _isExpandedCountry = !_isExpandedCountry;
                    });
                    DialogUtils.showAttach(
                      targetContext: context,
                      builder: (ctx) => DialogCountry(
                        onSelect: (value) {},
                      ),
                      maskColor: Colors.transparent,
                      onDismiss: () {
                        setState(() {
                          _isExpandedCountry = false;
                        });
                      },
                    );
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
                );
              }),
              SizedBox(
                width: 24.w,
              ),
              Expanded(
                child: Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      DialogUtils.showAttach(
                        targetContext: context,
                        builder: (ctx) => const DialogCategory(),
                        maskColor: Colors.transparent,
                        onDismiss: () {
                          setState(() {
                            _isExpandedCategory = false;
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
          ),
          Expanded(
            child: EasyRefresh(
              onRefresh: () async {},
              onLoad: () async {},
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const TabSellItemComponent(
                    companyName: '深圳市某某科技有限公司',
                    productName: '2024新款智能手表',
                    productDescription:
                        '支持心率监测、血氧检测、运动记录等多项功能，续航长达7天，防水防尘，适合各类运动场景。',
                    productImages: [
                      "http://gips2.baidu.com/it/u=195724436,3554684702&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                      "http://gips2.baidu.com/it/u=195724436,3554684702&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                      "http://gips2.baidu.com/it/u=195724436,3554684702&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                    ],
                    publishInfo: '2小时前发布',
                    avatarPath:
                        "http://gips2.baidu.com/it/u=195724436,3554684702&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                  );
                },
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
