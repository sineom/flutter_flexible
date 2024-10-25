// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_publish.p.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumHash() => r'8f0b6dcd6b4a4aa3e264aebbdf819a7fca87d6b2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Album extends BuildlessAutoDisposeNotifier<List<AssetEntity>> {
  late final String pageId;

  List<AssetEntity> build(
    String pageId,
  );
}

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
///
/// Copied from [Album].
@ProviderFor(Album)
const albumProvider = AlbumFamily();

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
///
/// Copied from [Album].
class AlbumFamily extends Family<List<AssetEntity>> {
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
  ///
  /// Copied from [Album].
  const AlbumFamily();

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
  ///
  /// Copied from [Album].
  AlbumProvider call(
    String pageId,
  ) {
    return AlbumProvider(
      pageId,
    );
  }

  @override
  AlbumProvider getProviderOverride(
    covariant AlbumProvider provider,
  ) {
    return call(
      provider.pageId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'albumProvider';
}

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
///
/// Copied from [Album].
class AlbumProvider
    extends AutoDisposeNotifierProviderImpl<Album, List<AssetEntity>> {
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
  ///
  /// Copied from [Album].
  AlbumProvider(
    String pageId,
  ) : this._internal(
          () => Album()..pageId = pageId,
          from: albumProvider,
          name: r'albumProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$albumHash,
          dependencies: AlbumFamily._dependencies,
          allTransitiveDependencies: AlbumFamily._allTransitiveDependencies,
          pageId: pageId,
        );

  AlbumProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageId,
  }) : super.internal();

  final String pageId;

  @override
  List<AssetEntity> runNotifierBuild(
    covariant Album notifier,
  ) {
    return notifier.build(
      pageId,
    );
  }

  @override
  Override overrideWith(Album Function() create) {
    return ProviderOverride(
      origin: this,
      override: AlbumProvider._internal(
        () => create()..pageId = pageId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pageId: pageId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Album, List<AssetEntity>> createElement() {
    return _AlbumProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumProvider && other.pageId == pageId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AlbumRef on AutoDisposeNotifierProviderRef<List<AssetEntity>> {
  /// The parameter `pageId` of this provider.
  String get pageId;
}

class _AlbumProviderElement
    extends AutoDisposeNotifierProviderElement<Album, List<AssetEntity>>
    with AlbumRef {
  _AlbumProviderElement(super.provider);

  @override
  String get pageId => (origin as AlbumProvider).pageId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
