///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-25 18:09:59
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-28 13:51:54
/// @FilePath: /flutter_flexible/lib/pages/app_main/home/sell/dialog_country.dart
/// @Description:国家列表选择
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/constants/themes/td_colors_ext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../../constants/i18n.dart';

class DialogCountry extends ConsumerStatefulWidget {
  const DialogCountry({super.key, required this.onSelect});

  final Function(String?) onSelect;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DialogCountryState();
}

class _DialogCountryState extends ConsumerState<DialogCountry> {
  final List<String> countryList = countryCode.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 0.6.sh,
      child: ListView.builder(
        itemBuilder: (context, index) {
          
          // 构建列表项的通用样式
          Widget buildListItem({
            required VoidCallback onTap,
            required Widget child,
          }) {
            return GestureDetector(
              onTap: onTap,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(12.r),
                child: child,
              ),
            );
          }

          // 构建文本样式
          TextStyle buildTextStyle() {
            return TextStyle(
              fontSize: 16.sp,
              color: TDTheme.of(context).fontBlackColor10,
            );
          }

          if (index == 0) {
            return buildListItem(
              onTap: () => widget.onSelect(null),
              child: Text("全部国家", style: buildTextStyle()),
            );
          }

          final key = countryList[index - 1];
          return buildListItem(
            onTap: () => widget.onSelect(key),
            child: Row(
              children: [
                CountryFlag.fromCountryCode(key, width: 40.w, height: 20.h),
                SizedBox(width: 8.w), // 添加间距
                Text(countryCode[key]!, style: buildTextStyle()),
              ],
            ),
          );
        },
        itemCount: countryList.length + 1,
      ),
    );
  }
}
