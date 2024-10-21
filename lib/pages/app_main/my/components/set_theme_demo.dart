///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-10 13:56:49
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-12 16:41:24
/// @FilePath: /flutter_flexible/lib/pages/app_main/my_personal/components/set_theme_demo.dart
/// @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
///
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../provider/theme_store.p.dart';
import '../../../../constants/themes/index_theme.dart';
import '../../../../provider/gray_model.p.dart';

class SetThemeDemo extends ConsumerStatefulWidget {
  const SetThemeDemo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SetThemeDemoState();
}

class _SetThemeDemoState extends ConsumerState<SetThemeDemo> {
  late bool appPageStore;

  @override
  Widget build(BuildContext context) {
    appPageStore = ref.watch(grayScaleModelProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: <Widget>[
            const Text('全局主题色切换', style: TextStyle(fontSize: 30)),
            btnWidget('切换粉色主题', themePink, Colors.pink),
            btnWidget('切换蓝灰主题', themeBlueGrey, Colors.blueGrey),
            btnWidget('切换天空蓝主题', themeLightBlue, Colors.lightBlue),
            btnWidget('暗模式', ThemeData.dark(),
                ThemeData.dark().colorScheme.background),
            grayBtn(),
          ],
        ),
      ],
    );
  }

  /// 灰度按钮
  Widget grayBtn() {
    return ElevatedButton(
      child: Text(
        '灰度模式--${appPageStore ? "开启" : "关闭"}',
        style: const TextStyle(fontSize: 22),
      ),
      onPressed: () {
        ref.read(grayScaleModelProvider.notifier).setGrayTheme(!appPageStore);
      },
    );
  }

  Widget btnWidget(String title, ThemeData themeData, Color color) {
    return ElevatedButton(
      onPressed: () {
        ref.read(themeStoreProvider.notifier).setTheme(themeData);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, color: Colors.white70),
      ),
    );
  }
}
