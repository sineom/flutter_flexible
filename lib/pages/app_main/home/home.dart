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
import '../../../components/update_app/check_app_version.dart';
import '../../../config/app_env.dart' show appEnv;

class Home extends StatefulWidget {
  const Home({Key? key, this.params}) : super(key: key);
  final dynamic params;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  FocusNode blankNode = FocusNode(); // 响应空白处的焦点的Node

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('home页面'),
        automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        onTap: () {
          // 点击空白页面关闭键盘
          FocusScope.of(context).requestFocus(blankNode);
        },
        child: contextWidget(),
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
              onPressed: () {
                checkAppVersion(forceUpdate: true);
              },
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
