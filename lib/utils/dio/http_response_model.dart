/// 
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 14:05:13
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-15 16:09:12
/// @FilePath: /flutter_flexible/lib/utils/dio/http_response_model.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved. 
 ///


/// 表示HTTP响应的模型
class HttpResponseModel {
  /// 响应数据
  final dynamic data;

  /// 响应状态码
  final int? code;

  /// 响应消息
  final String? msg;

  /// JSON映射
  Map<String, dynamic> get jsonMap => data ?? {};

  /// 成功响应
  HttpResponseModel.success(this.data) : code = 200, msg = null;

  /// 失败响应
  HttpResponseModel.failure({String? errorMsg, int? errorCode})
      : msg = errorMsg,
        code = errorCode,
        data = null;

  /// 检查响应是否成功
  bool get success => code == 200;
}