///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-10 13:56:49
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-14 15:28:58
/// @FilePath: /flutter_flexible/lib/utils/dio/interceptors/log_interceptor.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';
import '../../../config/app_config.dart';
import '../../tool/log_util.dart'; // 引入LogUtil

/// 日志拦截器，用于记录所有通过Dio发出的HTTP请求和响应
class LogsInterceptors extends InterceptorsWrapper {
  final _uuid = Uuid();

  /// 请求拦截，记录请求信息
  @override
  onRequest(RequestOptions options, handler) async {
    // 生成并存储请求标识符
    String requestId = _uuid.v4();
    options.extra['requestId'] = requestId;

    if (AppConfig.DEBUG) {
      LogUtil.d(
          """请求ID: $requestId\n请求url：${options.baseUrl + options.path}\n请求类型：${options.method}\n请求头：${options.headers.toString()}\nparams参数: ${options.queryParameters}""",
          requestId: requestId);
      if (options.data != null) {
        LogUtil.d("data参数: ${options.data}", requestId: requestId);
      }
    }
    return handler.next(options);
  }

  /// 响应拦截，记录响应信息
  @override
  onResponse(response, handler) async {
    String? requestId = response.requestOptions.extra['requestId'];
    if (AppConfig.DEBUG) {
      LogUtil.i('返回参数: $response', requestId: requestId);
    }

    return handler.next(response);
  }

  /// 错误拦截，记录错误信息
  @override
  onError(DioException err, handler) async {
    String? requestId = err.requestOptions.extra['requestId'];
    if (AppConfig.DEBUG) {
      LogUtil.e('请求异常信息: ${err.error}', requestId: requestId);
    }
    return handler.next(err);
  }
}
