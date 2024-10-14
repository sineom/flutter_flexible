import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global.p.g.dart';

@riverpod
class GlobalStore extends _$GlobalStore {
  late PageController barTabsController;

  @override
  bool build() {
    return false;
  }
  /// 是否显示灰度模式主题，true为灰度, false显示原有主题颜色
  void setGrayTheme([bool flag = false]) {
    state = flag;
  }
}
