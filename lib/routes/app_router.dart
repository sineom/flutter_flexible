///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 11:00:48
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-23 17:35:47
/// @FilePath: /flutter_flexible/lib/routes/app_router.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-10 15:49:59
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-10 15:52:14
/// @FilePath: /flutter_flexible/lib/routes/app_router.dart
/// @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
///
import 'package:auto_route/auto_route.dart';
import 'package:flutter_flexible/main.dart';

import 'app_router.gr.dart';

final appRouter = getIt<AppRouter>();

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: AppMainRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ErrorRoute.page),
        AutoRoute(page: PorductPublishSellRoute.page),
      ];
}
