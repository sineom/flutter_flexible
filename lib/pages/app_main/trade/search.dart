import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search页面'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.green,
        width: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('搜索内容'),
          ],
        ),
      ),
    );
  }
}
