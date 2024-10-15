///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 14:04:13
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-14 14:12:37
/// @FilePath: /flutter_flexible/lib/utils/dio/transform/default_transform.dart
/// @Description: 默认的转换器
/// @
/// @Copyright (c) 2024 by ${git_name_email}, All Rights Reserved.
///

import 'package:dio/dio.dart';
import 'package:flutter_flexible/utils/dio/http_response_model.dart';

import 'i_transform.dart';

class DefaultTransform implements ITransform {

  /// 实现单例模式
  static final DefaultTransform _instance = DefaultTransform._internal();

  factory DefaultTransform() {
    return _instance;
  }

  DefaultTransform._internal();

  @override
  HttpResponseModel parse(Response<dynamic>  response) {
    if (response.data["code"] == 200) {
      return HttpResponseModel.success(response.data["data"]);
    }
    return HttpResponseModel.failure(errorCode: response.data["code"],errorMsg: response.data["msg"]);
  }

}
