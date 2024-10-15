///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 14:04:12
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-14 14:13:30
/// @FilePath: /flutter_flexible/lib/utils/dio/transform/i_transform.dart
/// @Description: 转换器接口
/// @
/// @Copyright (c) 2024 by ${git_name_email}, All Rights Reserved.
///
import 'package:dio/dio.dart';

import '../http_response_model.dart';

abstract class ITransform {
  HttpResponseModel parse(Response<dynamic> response);
}
