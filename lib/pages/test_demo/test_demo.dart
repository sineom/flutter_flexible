///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-10 13:56:49
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-14 10:35:55
/// @FilePath: /flutter_flexible/lib/pages/test_demo/test_demo.dart
/// @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
///
///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-10 13:56:49
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-10 15:47:05
/// @FilePath: /flutter_flexible/lib/pages/test_demo/test_demo.dart
/// @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
///
///
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/pages/app_main/my_personal/components/set_theme_demo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/index.dart';

@RoutePage()
class TestDemoPage extends StatefulWidget {
  const TestDemoPage({super.key, this.params});
  final dynamic params;

  @override
  State<TestDemoPage> createState() => _TestDemoPageState();
}

class _TestDemoPageState extends State<TestDemoPage> {
  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  @override
  Widget build(BuildContext context) {
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
                        onPressed: () {
                        },
                      ),
                      _button(
                        '减-',
                        onPressed: () {
                        },
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
