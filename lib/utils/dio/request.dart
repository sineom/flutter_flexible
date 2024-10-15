import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_flexible/utils/tool/log_util.dart';
import '../../config/app_config.dart';
import 'http_parse/default_http_parse.dart';
import 'http_parse/i_http_parse.dart';
import 'http_response_model.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';
import 'transform/default_transform.dart';
import 'transform/i_transform.dart';

/// 初始化 Dio 实例
///
/// [baseOptions] 可选的基础配置参数
/// [baseUrl] 可选的基础 URL
/// [interceptors] 可选的拦截器列表
///
/// 返回一个配置好的 Dio 实例
Dio _initDio(
    {BaseOptions? baseOptions,
    String? baseUrl,
    List<Interceptor>? interceptors}) {
  BaseOptions baseOpts = baseOptions ??
      BaseOptions(
        connectTimeout: const Duration(seconds: 50000),
        baseUrl: baseUrl ?? AppConfig.host,
        responseType: ResponseType.plain, // 数据类型
        receiveDataWhenStatusError: true,
      );
  Dio dioClient = Dio(baseOpts); // 实例化请求，可以传入options参数
  dioClient.interceptors.addAll(interceptors ??
      [
        HeaderInterceptors(),
        LogsInterceptors(),
        RetryInterceptor(
          dio: dioClient,
          logPrint: LogUtil.w, // specify log function (optional)
          retries: 3, // retry count (optional)
          retryDelays: const [
            // set delays between retries (optional)
            Duration(seconds: 1), // wait 1 sec before first retry
            Duration(seconds: 2), // wait 2 sec before second retry
            Duration(seconds: 3), // wait 3 sec before third retry
          ],
        )
      ]);

  if (AppConfig.usingProxy) {
    dioClient.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client = HttpClient();
        client.findProxy = (uri) {
          // 设置Http代理，请注意，代理会在你正在运行应用的设备上生效，而不是在宿主平台生效。
          return "PROXY ${AppConfig.proxyAddress}";
        };
        // https证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
  }
  return dioClient;
}

/// 底层请求方法说明
///
/// [options] dio请求的配置参数，默认get请求
///
/// [data] 请求参数
///
/// [cancelToken] 请求取消对象
///
///```dart
///CancelToken token = CancelToken(); // 通过CancelToken来取消发起的请求
///
///safeRequest(
///  "/test",
///  data: {"id": 12, "name": "xx"},
///  options: Options(method: "POST"),
/// cancelToken: token,
///);
///
///// 取消请求
///token.cancel("cancelled");
///```

class Request {
  IHttpParse? httpParse;
  ITransform? httpTransformer;

  final BaseOptions? baseOptions;
  final String? baseUrl;
  final List<Interceptor>? interceptors;
  late Dio dioClient;

  /// 构造函数，初始化请求类
  ///
  /// [httpParse] 解析HTTP响应的处理器，默认为DefaultHttpParse
  /// [httpTransformer] HTTP响应转换器，默认为DefaultTransform
  /// [baseOptions] Dio的基础配置选项
  /// [baseUrl] 基础URL，如果配置了，会覆盖baseOptions中的baseUrl
  /// [interceptors] 拦截器列表 会覆盖默认的拦截器
  Request(
      {this.httpParse,
      this.httpTransformer,
      this.baseOptions,
      this.baseUrl,
      this.interceptors}) {
    httpParse ??= DefaultHttpParse();
    httpTransformer ??= DefaultTransform();
    dioClient = _initDio(
        baseOptions: baseOptions, baseUrl: baseUrl, interceptors: interceptors);
  }

  /// get请求
  Future<HttpResponseModel> get(
    String url, {
    Options? options,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
    IHttpParse? httpParse,
    ITransform? httpTransformer,
  }) async {
    return _safeRequest(
      url,
      options: options,
      queryParameters: queryParameters,
      httpParse: (httpParse ?? this.httpParse)!,
      httpTransformer: (httpTransformer ?? this.httpTransformer!),
      cancelToken: cancelToken,
    );
  }

  /// post请求
  Future<HttpResponseModel> post(
    String url, {
    Options? options,
    Object? data,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
    IHttpParse? httpParse,
    ITransform? httpTransformer,
  }) async {
    return _safeRequest(
      url,
      options: options?.copyWith(method: 'POST') ?? Options(method: 'POST'),
      data: data,
      queryParameters: queryParameters,
      httpParse: (httpParse ?? this.httpParse)!,
      httpTransformer: (httpTransformer ?? this.httpTransformer)!,
      cancelToken: cancelToken,
    );
  }

  /// put请求
  Future<HttpResponseModel> put(
    String url, {
    Options? options,
    Object? data,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
    IHttpParse? httpParse,
    ITransform? httpTransformer,
  }) async {
    return _safeRequest(
      url,
      options: options?.copyWith(method: 'PUT') ?? Options(method: 'PUT'),
      data: data,
      queryParameters: queryParameters,
      httpParse: (httpParse ?? this.httpParse)!,
      httpTransformer: (httpTransformer ?? this.httpTransformer)!,
      cancelToken: cancelToken,
    );
  }

  Future<HttpResponseModel> _safeRequest(
    String url, {
    Object? data,
    Options? options,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    required IHttpParse httpParse,
    required ITransform httpTransformer,
  }) async {
    try {
      return dioClient
          .request(
            url,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          )
          .then((data) =>
              httpParse.handleResponse(data, httpTransformer: httpTransformer));
    } catch (e) {
      print("其它错误$e");
      rethrow;
    }
  }

  /// 下载请求
  Future<void> download(
    String url,
    String savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      await dioClient.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
      );
    } catch (e) {
      print("下载错误: $e");
      rethrow;
    }
  }
}
