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

abstract class IHttpParse {

  /// 该函数子类可以不实现，默认实现
  HttpResponseModel handleResponse(Response<dynamic>? response,
      {ITransform? httpTransformer}) {
    httpTransformer ??= DefaultTransform();
    /// 返回值异常
    if (response == null) {
      return HttpResponseModel.failure(errorMsg: "返回值异常");
    }

    HttpResponseModel responseModel = httpTransformer.parse(response);

     /// 鉴权失败
    if (isTokenTimeout(responseModel.code)) {
      return HttpResponseModel.failure(errorMsg: "鉴权失败");
    }

    /// 接口调用是否成功
    if (!isRequestSuccess(responseModel.code)) {
      return HttpResponseModel.failure(errorCode: responseModel.code,errorMsg: responseModel.msg);
    }
   
    return responseModel;
  }

  /// 接口调用是否成功
  bool isRequestSuccess(int? statusCode) {
    return (statusCode != null && statusCode >= 200 && statusCode < 300);
  }

  /// 鉴权失败
  bool isTokenTimeout(int? statusCode) {
    return statusCode == 401;
  }
}

String handleError(DioException? error) {
    String errorDescription = "";
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioExceptionType.unknown:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioExceptionType.badResponse:
          errorDescription =
              "Received invalid status code: ${error.response?.statusCode}";
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "Bad certificate";
          break;
        case DioExceptionType.connectionError:
          errorDescription = "Connection error";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }
