///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-25 14:29:38
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-25 15:03:08
/// @FilePath: /flutter_flexible/lib/constants/themes/td_colors_ext.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

///
/// 业务使用时有两种方法替换主题：
/// 第一种：有独立设计风格的app，明确知道哪些色值用到，哪些设置没用到，有自己设计规范，则可单独配置色值。
/// 第二中：直接接入TDesign，配置所有色值组，此时不需再自定义key-value，可以直接使用。
///
/// 如果业务需要扩展，可以按一下方式定义自己的ColorData，只要key在主题中能找到对应颜色即可
/// TDesign主题包含的颜色，这是一个大而全的色值。业务可以选择自己自己需要的色值进行二次封装，方便使用。
/// 不过有的色值是内部使用的，必传，否则可能显示异常。
extension TDColorsExt on TDThemeData {

  /// #1D2129
  Color get fontBlackColor1 =>
      colorMap['fontBlackColor1'] ?? const Color(0xFF86909C);

  /// #1D2129
  Color get fontBlackColor10 =>
      colorMap['fontBlackColor10'] ?? const Color(0xFF1D2129);

  /// #cc000000
  Color get fontBlackColor11 =>
      colorMap['fontBlackColor11'] ?? const Color(0xCC000000);

  /// #F3F3F5
  Color get grayColor15 => colorMap['grayColor15'] ?? const Color(0xFFF3F3F5);

  /// #C9CDD4
  Color get grayColor16 => colorMap['grayColor16'] ?? const Color(0xFFC9CDD4);
}
