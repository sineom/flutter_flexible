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
Dio _initDio({
  BaseOptions? baseOptions,
  String? baseUrl,
  List<Interceptor>? interceptors,
}) {
  BaseOptions baseOpts = baseOptions ??
      BaseOptions(
        connectTimeout: const Duration(seconds: 50),
        baseUrl: baseUrl ?? AppConfig.host,
        responseType: ResponseType.plain,
        receiveDataWhenStatusError: true,
      );
  Dio dioClient = Dio(baseOpts);
  dioClient.interceptors.addAll(interceptors ??
      [
        HeaderInterceptors(),
        LogsInterceptors(),
        RetryInterceptor(
          dio: dioClient,
          logPrint: LogUtil.w,
          retries: 3,
          retryDelays: const [
            Duration(seconds: 1),
            Duration(seconds: 2),
            Duration(seconds: 3),
          ],
        )
      ]);

  if (AppConfig.usingProxy) {
    dioClient.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client = HttpClient();
        client.findProxy = (uri) => "PROXY ${AppConfig.proxyAddress}";
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
  }
  return dioClient;
}

/// 请求类封装
class Request {
  IHttpParse httpParse;
  ITransform httpTransformer;
  final BaseOptions? baseOptions;
  final String? baseUrl;
  final List<Interceptor>? interceptors;
  final Dio dioClient;

  /// 构造函数，初始化请求类
  Request({
    this.httpParse = const DefaultHttpParse(),
    this.httpTransformer = const DefaultTransform(),
    this.baseOptions,
    this.baseUrl,
    this.interceptors,
  }) : dioClient = _initDio(
          baseOptions: baseOptions,
          baseUrl: baseUrl,
          interceptors: interceptors,
        );

  /// GET 请求
  Future<HttpResponseModel> get(
    String url, {
    Options? options,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
    IHttpParse? customHttpParse,
    ITransform? customHttpTransformer,
  }) async {
    return _safeRequest(
      url,
      options: options,
      queryParameters: queryParameters,
      httpParse: customHttpParse ?? httpParse,
      httpTransformer: customHttpTransformer ?? httpTransformer,
      cancelToken: cancelToken,
    );
  }

  /// POST 请求
  Future<HttpResponseModel> post(
    String url, {
    Options? options,
    Object? data,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
    IHttpParse? customHttpParse,
    ITransform? customHttpTransformer,
  }) async {
    return _safeRequest(
      url,
      options: options?.copyWith(method: 'POST') ?? Options(method: 'POST'),
      data: data,
      queryParameters: queryParameters,
      httpParse: customHttpParse ?? httpParse,
      httpTransformer: customHttpTransformer ?? httpTransformer,
      cancelToken: cancelToken,
    );
  }

  /// PUT 请求
  Future<HttpResponseModel> put(
    String url, {
    Options? options,
    Object? data,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
    IHttpParse? customHttpParse,
    ITransform? customHttpTransformer,
  }) async {
    return _safeRequest(
      url,
      options: options?.copyWith(method: 'PUT') ?? Options(method: 'PUT'),
      data: data,
      queryParameters: queryParameters,
      httpParse: customHttpParse ?? httpParse,
      httpTransformer: customHttpTransformer ?? httpTransformer,
      cancelToken: cancelToken,
    );
  }

  /// 统一请求方法
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
      final  response = await dioClient.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return httpParse.handleResponse(
        response,
        httpTransformer: httpTransformer,
      );
    } catch (e) {
      LogUtil.e("请求错误: $e");
      rethrow;
    }
  }

  /// 下载文件
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
      LogUtil.e("下载错误: $e");
      rethrow;
    }
  }
}