///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-14 17:18:19
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-14 17:30:00
/// @FilePath: /flutter_flexible/lib/services/common_repository.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../provider/dio.p.dart';

part 'common_repository.g.dart';

/// 获取示例数据。
/// 使用GET方法从指定的URL获取数据。
@riverpod
Future<Object> getDemo(GetDemoRef ref) async {
  return ref.watch(autoDisposeFutureProvider(
    (request, cancelToken) async {
      await Future.delayed(const Duration(seconds: 2));
      return request.get('/m1/3617283-3245905-default/pet/1',
          queryParameters: {'corpId': 'e00fd7513077401013c0'},
          cancelToken: cancelToken);
    },
  ));
}


