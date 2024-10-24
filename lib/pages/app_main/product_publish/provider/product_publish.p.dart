import 'package:flutter/material.dart';
import 'package:flutter_flexible/utils/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
part 'product_publish.p.g.dart';

///
/// @Author: sineom h.sineom@gmail.com
/// @Date: 2024-10-24 14:12:30
/// @LastEditors: sineom h.sineom@gmail.com
/// @LastEditTime: 2024-10-24 16:35:38
/// @FilePath: /flutter_flexible/lib/pages/app_main/product_publish/provider/product_publish.p.dart
/// @Description: 商品发布的product
/// @
/// @Copyright (c) 2024 by sineom, All Rights Reserved.
///

@riverpod
class Album extends _$Album {
  @override
  List<AssetEntity> build(String pageId) {
    // 初始状态
    return [];
  }

  // 选择相册
  /// [add] 是否追加选择, 默认不追加
  Future<void> selectAlbum(BuildContext context,
      {AssetPickerConfig pickerConfig = const AssetPickerConfig(),
      bool add = false}) async {
    final List<AssetEntity>? result =
        await AssetPicker.pickAssets(context, pickerConfig: pickerConfig);
    // 追加选择的图片
    if (add) {
      state = [...state, ...result ?? []];
    } else {
      state = [...result ?? []];
    }
    LogUtil.d("selectAlbum result: ${result?.first.toString()}");
  }

  // 取消选择照片
  void deletePhoto(AssetEntity asset) {
    // 实现取消选择照片的逻辑
    state = [...state..remove(asset)];
  }

  /// 根据index删除
  void deletePhotoByIndex(int index) {
    state = [...state..removeAt(index)];
  }

  // 清空选择
  void clear() {
    // 实现清空选择的逻辑
    state = [];
  }
}
