import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gray_model.p.g.dart';

@riverpod
class GrayScaleModel extends _$GrayScaleModel {
  @override
  bool build() {
    return false;
  }
  /// 是否显示灰度模式主题，true为灰度, false显示原有主题颜色
  void setGrayTheme([bool flag = false]) {
    state = flag;
  }
}
