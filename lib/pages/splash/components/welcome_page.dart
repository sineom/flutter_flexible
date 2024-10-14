///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-10 13:56:49
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-10 17:40:30
/// @FilePath: /flutter_flexible/lib/pages/splash/components/welcome_page.dart
/// @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
///
import 'package:flutter/material.dart';
import 'package:flutter_flexible/routes/app_router.dart';
import 'package:flutter_flexible/routes/app_router.gr.dart';

/// 指引页面
class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final String _info = '引导页～';

  @override
  void initState() {
    super.initState();
    _initBanner();
  }

  /// App引导页逻辑。
  void _initBanner() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(_info),
          ),
        ],
      ),
      // 欢迎页测试按钮，手动跳转
      floatingActionButton: FloatingActionButton(
        heroTag: 'welcomBtn',
        child: const Icon(Icons.navigate_next),
        onPressed: () {
          appRouter.replace(AppMainRoute());
        },
      ),
    );
  }
}
