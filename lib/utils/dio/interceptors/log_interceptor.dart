///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-10 13:56:49
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-15 16:22:14
/// @FilePath: /flutter_flexible/lib/utils/dio/interceptors/log_interceptor.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
///
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';
import '../../../config/app_config.dart';
import '../../tool/log_util.dart';

/// 日志拦截器，用于记录所有通过Dio发出的HTTP请求和响应
class LogsInterceptors extends InterceptorsWrapper {
  final Uuid _uuid = Uuid();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String requestId = _uuid.v4();
    options.extra['requestId'] = requestId;

    if (AppConfig.DEBUG) {
      _logRequest(options, requestId);
    }
    handler.next(options);
  }

  @override
  Future<void> onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    String? requestId = response.requestOptions.extra['requestId'];
    if (AppConfig.DEBUG) {
      LogUtil.i('请求ID: $requestId\n响应数据: ${response.data}',
          requestId: requestId);
    }
    handler.next(response);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    String? requestId = err.requestOptions.extra['requestId'];
    if (AppConfig.DEBUG) {
      LogUtil.e('请求ID: $requestId\n错误信息: ${err.error}', requestId: requestId);
    }
    handler.next(err);
  }

  void _logRequest(RequestOptions options, String requestId) {
    StringBuffer log = StringBuffer();
    log.writeln('请求ID: $requestId');
    log.writeln('请求URL: ${options.baseUrl}${options.path}');
    log.writeln('请求方法: ${options.method}');
    log.writeln('请求头: ${options.headers}');
    log.writeln('查询参数: ${options.queryParameters}');
    if (options.data != null) {
      log.writeln('请求体: ${options.data}');
    }
    LogUtil.d(log.toString(), requestId: requestId);
  }
}
