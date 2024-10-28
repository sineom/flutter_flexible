///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-28 13:56:00
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-28 14:58:33
/// @FilePath: /flutter_flexible/lib/pages/app_main/home/sell/tab_sell_item_component.dart
/// @Description: 首页tab销售列表的item组件
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/components/index.dart';
import 'package:flutter_flexible/constants/themes/td_colors_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabSellItemComponent extends StatelessWidget {
  final String companyName;
  final String productName;
  final String productDescription;
  final List<String> productImages;
  final String publishInfo;
  final String avatarPath;

  const TabSellItemComponent({
    super.key,
    required this.companyName,
    required this.productName,
    required this.productDescription,
    required this.productImages,
    required this.publishInfo,
    required this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = TDTheme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 顶部公司信息
          Row(
            children: [
              CircleAvatar(
                backgroundImage: ExtendedNetworkImageProvider(avatarPath),
                radius: 20.r,
              ),
              SizedBox(width: 8.r),
              Expanded(
                child: Text(
                  companyName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: theme.fontBlackColor10,
                  ),
                ),
              ),
              TDButton(
                onTap: () {},
                text: '关注',
                size: TDButtonSize.small,
                theme: TDButtonTheme.primary,
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_city, size: 16.r, color: theme.grayColor16),
              Text('深圳公司',
                  style: TextStyle(fontSize: 13.sp, color: theme.grayColor16)),
            ],
          ),
          SizedBox(height: 16.r),
          // 产品信息
          Text(
            productName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: theme.fontBlackColor10,
            ),
          ),
          Text(productDescription),
          SizedBox(height: 8.r),
          // 产品图片
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: productImages.map((imagePath) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.r),
                  child: ExtendedImg(
                    imageUrl: imagePath,
                    width: 100.r,
                    height: 100.r,
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16.r),
          // 发布时间
          Text(
            publishInfo,
            style: TextStyle(color: theme.grayColor16, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
