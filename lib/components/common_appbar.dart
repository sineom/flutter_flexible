///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-24 17:13:43
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-24 17:16:20
/// @FilePath: /flutter_flexible/lib/components/common_appbar.dart
/// @Description: A common AppBar component for the application.
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppbar extends AppBar {
  CommonAppbar({
    super.key,
    required String title,
    Widget? titleWidget,
    bool? centerTitle,
    Color? backgroundColor,
    super.actions,
    super.leading,
  }) : super(
          centerTitle: centerTitle ?? true, // Default to center title
          backgroundColor: backgroundColor ?? Colors.white,
          title: titleWidget ??
              Text(title,
                  style: TextStyle(color: Colors.black, fontSize: 18.sp)),
        );
}
