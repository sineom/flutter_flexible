///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 14:29:34
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-15 16:08:34
/// @FilePath: /flutter_flexible/lib/utils/dio/http_parse/i_http_parse.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 14:29:34
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-14 14:32:08
/// @FilePath: /flutter_flexible/lib/utils/dio/http_parse/i_http_parse.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by ${sineom}, All Rights Reserved.
///
import 'package:dio/dio.dart';

import '../http_response_model.dart';
import '../transform/default_transform.dart';
import '../transform/i_transform.dart';

/// HTTP解析接口
abstract class IHttpParse {
  /// 处理HTTP响应
  HttpResponseModel handleResponse(
    Response<dynamic>? response, {
    ITransform? httpTransformer,
  });

  /// 判断请求是否成功
  bool isRequestSuccess(int? statusCode);

  /// 判断是否鉴权失败
  bool isTokenTimeout(int? statusCode);
}

/// 错误处理函数
String handleError(DioException? error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return "请求被取消";
      case DioExceptionType.connectionTimeout:
        return "连接超时";
      case DioExceptionType.receiveTimeout:
        return "接收数据超时";
      case DioExceptionType.badResponse:
        return "错误的响应状态码: ${error.response?.statusCode}";
      case DioExceptionType.sendTimeout:
        return "发送数据超时";
      case DioExceptionType.badCertificate:
        return "证书错误";
      case DioExceptionType.connectionError:
        return "连接错误";
      default:
        return "未知错误";
    }
  }
  return "意外错误发生";
}
