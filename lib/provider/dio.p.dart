///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-15 11:12:10
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-24 14:25:36
/// @FilePath: /flutter_flexible/lib/provider/dio.p.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/dio/http_response_model.dart';
import '../utils/dio/request.dart';

part 'dio.p.g.dart';

typedef FetchAction = dynamic Function(
    Request request, CancelToken cancelToken);

// 自动取消的FutureProvider
final autoDisposeFutureProvider = FutureProvider.autoDispose
    .family<HttpResponseModel, FetchAction>((ref, FetchAction action) async {
  final request = Request();

  // 创建一个CancelToken用于取消请求
  final cancelToken = ref.watch(cancelTokenProvider);

  // 当provider被销毁时，取消请求
  ref.onDispose(() {
    cancelToken.cancel();
  });

  try {
    // 调用传入的函数执行实际的请求
    final response = await action(request, cancelToken);
    ref.keepAlive(); // 如果请求成功，保持状态
    return response;
  } catch (e) {
    // 处理错误，可能需要根据实际情况进行调整
    throw Exception('Failed to load data');
  }
});

@riverpod
CancelToken cancelToken(CancelTokenRef ref) {
  final cancelToken = CancelToken();
  ref.onDispose(() {
    cancelToken.cancel();
  });
  return cancelToken;
}
