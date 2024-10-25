///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 11:00:48
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-25 17:28:41
/// @FilePath: /flutter_flexible/lib/pages/app_main/home/home.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 11:00:48
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-14 16:24:59
/// @FilePath: /flutter_flexible/lib/pages/app_main/home/home.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/constants/themes/td_colors_ext.dart';
import 'package:flutter_flexible/generated/assets.dart';
import 'package:flutter_flexible/pages/app_main/home/sell/home_tab_sell_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.params});
  final dynamic params;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;
  FocusNode blankNode = FocusNode(); // 响应空白处的焦点的Node

  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  final List<String> tabs = ["出售", "求购", "已关注"];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300.h,
                padding: EdgeInsets.fromLTRB(
                    18.w, ScreenUtil().statusBarHeight, 18.w, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: ExtendedAssetImageProvider(
                            Assets.imagesIconHomeTopBg))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "Electronic",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: TDTheme.of(context).brandColor7),
                          ),
                          TextSpan(
                              text: "Market",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: TDTheme.of(context).fontBlackColor10)),
                        ])),
                        const Spacer(),
                        TDButton(
                          type: TDButtonType.text,
                          onTap: () {},
                          iconWidget: Icon(
                            Icons.location_on_rounded,
                            size: 24.sp,
                          ),
                          text: "English",
                          textStyle: TextStyle(
                              fontSize: 16.sp,
                              color: TDTheme.of(context).fontBlackColor10),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TDTabBar(
                        controller: _tabController,
                        isScrollable: true,
                        indicatorColor: TDTheme.of(context).brandColor7,
                        showIndicator: true,
                        labelColor: TDTheme.of(context).fontBlackColor10,
                        unselectedLabelColor:
                            TDTheme.of(context).fontBlackColor11,
                        labelStyle: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                        tabs: tabs
                            .map((e) => TDTab(
                                  text: e,
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                top: 135.h,
                child:
                    TDTabBarView(controller: _tabController, children: const [
                  HomeTabSellPage(),
                  HomeTabSellPage(),
                  HomeTabSellPage(),
                ]),
              )
            ],
          )
        ],
      ),
    );
  }
}
