///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-10 13:56:49
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-10 17:59:01
/// @FilePath: /flutter_flexible/lib/provider/theme_store.p.dart
/// @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
///
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../constants/themes/index_theme.dart';

part 'theme_store.p.g.dart';

// Provider状态管理使用
@riverpod
class ThemeStore extends _$ThemeStore {
  @override
  ThemeData build() {
    return themeBlueGrey;
  }
  // ThemeData _themeData = themeBlueGrey;

  // 更新全局主题样式
  void setTheme(ThemeData themeName) {
    state = themeName;
  }
}
