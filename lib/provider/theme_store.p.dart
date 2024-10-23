///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 11:00:48
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-23 14:51:04
/// @FilePath: /flutter_flexible/lib/provider/theme_store.p.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.

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

  // 更新全局主题样式
  void setTheme(ThemeData themeName) {
    state = themeName;
  }
}
