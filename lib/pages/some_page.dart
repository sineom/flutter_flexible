import 'package:flutter/material.dart';
import '../components/image/extended_img.dart';

class SomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExtendedImg(
          imageUrl: 'https://example.com/image.jpg',
          sourceType: ImageSourceType.network,
        ),
        ExtendedImg(
          imageUrl: 'assets/images/local_image.png',
          sourceType: ImageSourceType.asset,
        ),
        ExtendedImg(
          imageUrl: '/path/to/image.jpg',
          sourceType: ImageSourceType.file,
        ),
      ],
    );
  }
}
