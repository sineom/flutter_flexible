// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_item.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GalleryItemImpl _$$GalleryItemImplFromJson(Map<String, dynamic> json) =>
    _$GalleryItemImpl(
      id: json['id'] as String,
      resource: json['resource'] as String,
      imageType: $enumDecode(_$ImageSourceTypeEnumMap, json['imageType']),
    );

Map<String, dynamic> _$$GalleryItemImplToJson(_$GalleryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resource': instance.resource,
      'imageType': _$ImageSourceTypeEnumMap[instance.imageType]!,
    };

const _$ImageSourceTypeEnumMap = {
  ImageSourceType.network: 'network',
  ImageSourceType.asset: 'asset',
  ImageSourceType.file: 'file',
};
