///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-24 15:04:04
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-25 15:58:58
/// @FilePath: /flutter_flexible/lib/components/image/grallery/gallery_item.m.dart
/// @Description:
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../extended_img.dart';

part 'gallery_item.m.freezed.dart';

@freezed
class GalleryItem with _$GalleryItem {
  const factory GalleryItem({
    required String id,
    String? resource,
    AssetEntity? asset,
    ImageSourceType? imageType,
  }) = _GalleryItem;
}
