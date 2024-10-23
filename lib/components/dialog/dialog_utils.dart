import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class DialogUtils {
  ///取消dialog
  static Future<void> dismiss<T>({
    SmartStatus status = SmartStatus.smart,
    String? tag,
    T? result,
    bool force = false,
  }) async {
    await SmartDialog.dismiss(
        status: status, tag: tag, result: result, force: force);
  }
}
