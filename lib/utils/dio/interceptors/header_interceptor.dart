///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-10 13:56:49
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-15 16:06:22
/// @FilePath: /flutter_flexible/lib/utils/dio/interceptors/header_interceptor.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:dio/dio.dart';

/// Header拦截器，用于添加通用请求头
class HeaderInterceptors extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Content-Type'] = 'application/json';
    // 如果有认证token，可以在这里添加
    // options.headers['Authorization'] = 'Bearer your_token';
    handler.next(options);
  }

  @override
  Future<void> onResponse(
      final  response, ResponseInterceptorHandler handler) async {
    // 可以在这里处理响应头
    handler.next(response);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    // 可以在这里处理错误信息
    handler.next(err);
  }
}
