import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible/constants/themes/td_colors_ext.dart';
import 'package:flutter_flexible/generated/assets.dart';
import 'package:flutter_flexible/routes/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../components/dialog/dialog_utils.dart';
import '../../../routes/app_router.gr.dart';

class ProductType extends StatelessWidget {
  const ProductType({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(16.r), right: Radius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(40.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '产品发布',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: TDTheme.of(context).fontBlackColor10),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ReleaseItem(
                    title: "出售信息",
                    icon: Assets.imagesIconSellRelease,
                    onTap: () {
                      appRouter.push(const ProductPublishSellRoute());
                    }),
                _ReleaseItem(
                    title: "求购信息",
                    icon: Assets.imagesIconAskBuyRelease,
                    onTap: () {
                      appRouter.push(const ProductPublishBuyRoute());
                    }),
                _ReleaseItem(
                    title: "交易商品",
                    icon: Assets.imagesIconTradeRelease,
                    onTap: () {
                      appRouter.push(const ProductPublishTradeRoute());
                    }),
              ],
            ),
            SizedBox(
              height: 72.h,
            ),
            TDButton(
              type: TDButtonType.text,
              size: TDButtonSize.large,
              iconWidget: ExtendedImage.asset(
                Assets.imagesIconAddSelected,
                width: 42.r,
                height: 42.r,
              ),
              onTap: () {
                DialogUtils.dismiss();
              },
            )
          ],
        ),
      ),
    );
  }
}

/// 发布的Item
class _ReleaseItem extends StatelessWidget {
  const _ReleaseItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
        DialogUtils.dismiss();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ExtendedImage.asset(
            icon,
            width: 64.r,
            height: 64.r,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 14.sp,
                color: TDTheme.of(context).fontBlackColor10,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
