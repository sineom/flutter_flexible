import 'package:freezed_annotation/freezed_annotation.dart';

import '../extended_img.dart';

part 'gallert_item.m.freezed.dart';
part 'gallery_item.m.g.dart';

@freezed
class GalleryItem with _$GalleryItem {
  const factory GalleryItem({
    required String id,
    required String resource,
    required ImageSourceType imageType,
  }) = _GalleryItem;

  factory GalleryItem.fromJson(Map<String, dynamic> json) =>
      _$GalleryItemFromJson(json);
}
