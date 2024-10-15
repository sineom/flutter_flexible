import 'package:dio/dio.dart';
import '../transform/default_transform.dart';
import 'i_http_parse.dart';
import '../http_response_model.dart';
import '../transform/i_transform.dart';

/// 默认的HTTP解析实现
class DefaultHttpParse implements IHttpParse {

  /// 构造函数，可传入自定义转换器
  const DefaultHttpParse();

  @override
  HttpResponseModel handleResponse(
    Response<dynamic>? response, {
    ITransform? httpTransformer,
  }) {
    httpTransformer ??= const DefaultTransform();

    if (response == null) {
      return HttpResponseModel.failure(errorMsg: "响应为空");
    }

    HttpResponseModel responseModel = httpTransformer.parse(response);

    if (isTokenTimeout(responseModel.code)) {
      return HttpResponseModel.failure(errorMsg: "鉴权失败");
    }

    if (!isRequestSuccess(responseModel.code)) {
      return HttpResponseModel.failure(
        errorCode: responseModel.code,
        errorMsg: responseModel.msg,
      );
    }

    return responseModel;
  }

  @override
  bool isRequestSuccess(int? statusCode) {
    return statusCode == 200;
  }

  @override
  bool isTokenTimeout(int? statusCode) {
    return statusCode == 401;
  }
}
