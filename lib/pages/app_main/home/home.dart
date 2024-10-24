///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 11:00:48
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-23 11:30:31
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
import 'package:flutter/material.dart';
import 'package:flutter_flexible/routes/app_router.dart';
import 'package:flutter_flexible/routes/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/app_env.dart' show appEnv;
import 'package:moon_design/moon_design.dart';

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
          Container(
            padding: EdgeInsets.fromLTRB(
                18.w, ScreenUtil().statusBarHeight, 18.w, 0),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0x0E6BFE), Color(0x000E6BFE)])),
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
                            color: context.moonColors!.textPrimary),
                      ),
                      TextSpan(
                          text: "Market",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: context.moonColors!.textSecondary)),
                    ])),
                    const Spacer(),
                    MoonTextButton(
                      onTap: () {},
                      leading: Icon(
                        Icons.location_on,
                        size: 24.sp,
                      ),
                      label: Text("English"),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MoonTabBar(
                    tabController: _tabController,
                    tabs: tabs
                        .map((e) => MoonTab(
                              label: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: context.moonColors!.textSecondary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget contextWidget() {
    return ListView(
      children: List.generate(1, (index) {
        return Column(
          children: <Widget>[
            Text('App渠道：${appEnv.getAppChannel()}'),
            _button(
              '跳转test页',
              onPressed: () {
                appRouter
                    .push(TestDemoRoute(params: const {'data': '别名路由传参666'}));
              },
            ),
            Text('状态管理值：'),
            _button(
              '加+',
              onPressed: () {},
            ),
            _button(
              '减-',
              onPressed: () {},
            ),
            _button(
              '强制更新App',
              onPressed: () {},
            ),
          ],
        );
      }),
    );
  }

  Widget _button(String text, {VoidCallback? onPressed}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 22.sp),
        ),
      ),
    );
  }
}
