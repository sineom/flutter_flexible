///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 11:00:48
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-21 10:58:36
/// @FilePath: /flutter_flexible/lib/pages/test_demo/test_demo.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 11:00:48
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-14 17:35:06
/// @FilePath: /flutter_flexible/lib/pages/test_demo/test_demo.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/pages/app_main/my/components/set_theme_demo.dart';
import 'package:flutter_flexible/services/common_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/index.dart';

@RoutePage()
class TestDemoPage extends ConsumerStatefulWidget {
  const TestDemoPage({super.key, this.params});
  final dynamic params;

  @override
  ConsumerState<TestDemoPage> createState() => _TestDemoPageState();
}

class _TestDemoPageState extends ConsumerState<TestDemoPage> {
  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  @override
  Widget build(BuildContext context) {
    final demo = ref.watch(getDemoProvider.future);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test页面'),
      ),
      body: Column(
        children: [
          SetThemeDemo(),
          Expanded(
            child: ListView(
              children: List.generate(1, (index) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '状态共享值：',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        '路由接收参数》》${widget.params}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      _button(
                        '加+',
                        onPressed: () async {
                          ref.refresh(getDemoProvider.future);
                        },
                      ),
                      _button(
                        '减-',
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ), //
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
