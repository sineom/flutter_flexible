///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-25 16:52:50
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-25 16:53:00
/// @FilePath: /flutter_flexible/lib/components/empty_page.dart
/// @Description:空页面
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TDEmpty(
      image: ExtendedImage.asset(
        Assets.imagesEmpty,
        width: 160.r,
        height: 160.r,
      ),
    );
  }
}
