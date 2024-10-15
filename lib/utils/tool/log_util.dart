///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-10 13:56:49
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-14 14:55:41
/// @FilePath: /flutter_flexible/lib/utils/tool/log_util.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by ${sineom}, All Rights Reserved.
///
import 'package:logger/logger.dart';
import '../../config/app_env.dart' show appEnv, ENV;

/// 日志工具类，用于在应用中统一管理日志输出
class LogUtil {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 5,       // 显示的方法调用数
      errorMethodCount: 5,  // 错误时显示的方法调用数
      lineLength: 120,      // 日志行的长度
      colors: true,         // 日志中使用颜色
      printEmojis: true,    // 日志中使用表情符号
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,   // 日志时间格式
    ),
  );

  /// 输出调试级别的日志，非生产环境使用
  static d(Object? data,  {bool allowInProd = false, String? requestId}) {
    if (appEnv.currentEnv != ENV.PROD || allowInProd) {
      _logger.d("${requestId ?? ''} $data");
    }
  }

  /// 输出信息级别的日志，非生产环境使用
  static i(Object? data, {bool allowInProd = false, String? requestId}) {
    if (appEnv.currentEnv != ENV.PROD || allowInProd) {
      _logger.i("${requestId ?? ''} $data");
    }
  }

  /// 输出警告级别的日志，适用于所有环境
  static w(Object? data, {String? requestId}) {
    _logger.w("${requestId ?? ''} $data");
  }

  /// 输出错误级别的日志，适用于所有环境
  static e(Object? data, {String? requestId}) {
    _logger.e("${requestId ?? ''} $data");
  }
}
