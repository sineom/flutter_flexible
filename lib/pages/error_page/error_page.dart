///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-10 13:56:49
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-10 15:54:09
/// @FilePath: /flutter_flexible/lib/pages/error_page/error_page.dart
/// @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
///
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// 错误页面
@RoutePage()
class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key, this.params, this.title, this.errorText});
  final dynamic params;

  /// 页面标题
  final String? title;

  /// 页面内容
  final String? errorText;

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Error'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Icon(Icons.error, color: Colors.red, size: 66),
            ),
            SelectableText(
              widget.errorText ?? '错误：未定义的路由',
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
