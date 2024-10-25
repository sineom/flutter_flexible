///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 11:00:48
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-25 13:47:32
/// @FilePath: /flutter_flexible/lib/main.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by ${git_name_email}, All Rights Reserved.
///
///
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'constants/themes/td_theme.dart';
import 'provider/gray_model.p.dart';
import 'routes/app_router.dart';
import 'provider/theme_store.p.dart'; // 全局主题

final getIt = GetIt.instance;

Future<void> main() async {
  getIt.registerSingleton<AppRouter>(AppRouter());
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('zh', 'CH')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('en', 'US'),
      child: const ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late TDThemeData _themeData;
  Locale? locale = const Locale('zh');

  @override
  void initState() {
    super.initState();
    _themeData = TDThemeData.fromJson("default", tdTheme)!;
  }

  @override
  Widget build(BuildContext context) {
    final themeStore = ref.watch(themeStoreProvider);
    final isGrayScaleMode = ref.watch(grayScaleModelProvider);
    // 使用多套主题
    TDTheme.needMultiTheme();

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(376, 812),
      builder: (context, child) {
        // 使用 ShaderMask 来实现灰度效果
        Widget appContent = MaterialApp.router(
          showPerformanceOverlay: false,
          locale: const Locale('zh', 'CH'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('zh', 'CH'),
            Locale('en', 'US'),
          ],
          builder: FlutterSmartDialog.init(),
          theme: themeStore.copyWith(
              extensions: [_themeData]),
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(
              navigatorObservers: () => [FlutterSmartDialog.observer]),
        );

        // 如果启用灰度模式，则应用 ShaderMask
        if (isGrayScaleMode) {
          appContent = ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Colors.grey, Colors.grey],
              ).createShader(bounds);
            },
            blendMode: BlendMode.saturation,
            child: appContent,
          );
        }

        return appContent;
      },
    );
  }
}
