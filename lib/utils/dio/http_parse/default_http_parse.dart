import 'i_http_parse.dart';

class DefaultHttpParse extends IHttpParse {

  /// 实现单例模式
  static final DefaultHttpParse _instance = DefaultHttpParse._internal();

  factory DefaultHttpParse() {
    return _instance;
  }

  DefaultHttpParse._internal();


}
