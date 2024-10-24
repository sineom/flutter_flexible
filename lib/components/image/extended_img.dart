// lib/components/extended_img.dart
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 图片资源类型枚举，支持网络、资源文件和本地文件
enum ImageSourceType { network, asset, file }

/// 扩展图片加载组件，支持多种图片资源类型，并允许自定义占位图（Widget 或资源路径）、缓存和颜色设置
class ExtendedImg extends StatelessWidget {
  /// 图片的来源地址
  final String? imageUrl;

  /// 图片的来源类型，默认是网络图片
  final ImageSourceType? sourceType;

  /// 图片的宽度
  final double? width;

  /// 图片的高度
  final double? height;

  /// 图片的填充模式，默认是 BoxFit.cover
  final BoxFit fit;

  /// 图片的圆角，默认是无圆角
  final BorderRadius? borderRadius;

  /// 是否启用缓存，默认启用
  final bool cache;

  /// 加载中的占位图，可以是自定义的 Widget
  final Widget? loadingPlaceholder;

  /// 加载中的占位图，可以是资源文件的路径
  final String? loadingPlaceholderAsset;

  /// 加载失败时的占位图，可以是自定义的 Widget
  final Widget? errorPlaceholder;

  /// 加载失败时的占位图，可以是资源文件的路径
  final String? errorPlaceholderAsset;

  /// 图片的颜色叠加，例如颜色过滤
  final Color? color;

  /// The image to display.
  final ImageProvider? image;

  /// 构造函数，初始化 ExtendedImg 组件
  ///
  /// [imageUrl] 必填，图片的地址
  /// [sourceType] 图片的来源类型，默认是网络图片
  /// [width] 图片的宽度
  /// [height] 图片的高度
  /// [fit] 图片的填充模式，默认是 BoxFit.cover
  /// [borderRadius] 图片的圆角，默认是无圆角
  /// [cache] 是否启用缓存，默认启用
  /// [loadingPlaceholder] 加载中的自定义占位图 Widget
  /// [loadingPlaceholderAsset] 加载中的占位图资源文件路径
  /// [errorPlaceholder] 加载失败时的自定义占位图 Widget
  /// [errorPlaceholderAsset] 加载失败时的占位图资源文件路径
  /// [color] 图片的颜色叠加
  const ExtendedImg({
    super.key,
    required this.imageUrl,
    this.sourceType = ImageSourceType.network,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.cache = true,
    this.loadingPlaceholder,
    this.loadingPlaceholderAsset,
    this.errorPlaceholder,
    this.errorPlaceholderAsset,
    this.color,
    this.image,
  });

  const ExtendedImg.asset({
    super.key,
    required this.imageUrl,
    this.sourceType = ImageSourceType.asset,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.cache = true,
    this.loadingPlaceholder,
    this.loadingPlaceholderAsset,
    this.errorPlaceholder,
    this.errorPlaceholderAsset,
    this.color,
    this.image,
  });

  const ExtendedImg.file({
    super.key,
    required this.imageUrl,
    this.sourceType = ImageSourceType.file,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.cache = true,
    this.loadingPlaceholder,
    this.loadingPlaceholderAsset,
    this.errorPlaceholder,
    this.errorPlaceholderAsset,
    this.color,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(8.r),
      child: _buildImage(),
    );
  }

  /// 根据图片来源类型构建不同的图片加载方法
  Widget _buildImage() {
    if (image != null) {
      return ExtendedImage(
        image: image!,
        width: width,
        height: height,
        fit: fit,
        enableMemoryCache: cache,
        clearMemoryCacheWhenDispose: true,
        color: color,
        clearMemoryCacheIfFailed: true,
        loadStateChanged: _loadStateChanged,
      );
    }
    switch (sourceType) {
      case ImageSourceType.network:
        return ExtendedImage.network(
          imageUrl!,
          width: width,
          height: height,
          fit: fit,
          cache: cache,
          enableMemoryCache: cache,
          clearMemoryCacheWhenDispose: true,
          color: color,
          loadStateChanged: _loadStateChanged,
        );
      case ImageSourceType.asset:
        return ExtendedImage.asset(
          imageUrl!,
          width: width,
          height: height,
          fit: fit,
          color: color,
          loadStateChanged: _loadStateChanged,
          enableMemoryCache: cache,
          clearMemoryCacheWhenDispose: true,
        );
      case ImageSourceType.file:
        return ExtendedImage.file(
          File(imageUrl!),
          width: width,
          height: height,
          fit: fit,
          color: color,
          loadStateChanged: _loadStateChanged,
          enableMemoryCache: cache,
          clearMemoryCacheWhenDispose: true,
        );
      default:
        return const SizedBox();
    }
  }

  /// 根据图片的加载状态显示不同的占位图
  ///
  /// [state] 当前图片的加载状态
  Widget? _loadStateChanged(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        if (loadingPlaceholder != null) {
          return loadingPlaceholder;
        } else if (loadingPlaceholderAsset != null) {
          return Image.asset(
            loadingPlaceholderAsset!,
            width: width,
            height: height,
            fit: BoxFit.contain,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      case LoadState.completed:
        // 加载完成，显示图片
        return null;
      case LoadState.failed:
        if (errorPlaceholder != null) {
          return errorPlaceholder;
        } else if (errorPlaceholderAsset != null) {
          return Image.asset(
            errorPlaceholderAsset!,
            width: width,
            height: height,
            fit: BoxFit.contain,
          );
        } else {
          return const Center(child: Icon(Icons.error, color: Colors.red));
        }
    }
  }
}
