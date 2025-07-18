/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  /// Directory path: assets/icon/appbar_icon
  $AssetsIconAppbarIconGen get appbarIcon => const $AssetsIconAppbarIconGen();

  /// Directory path: assets/icon/community_icon
  $AssetsIconCommunityIconGen get communityIcon =>
      const $AssetsIconCommunityIconGen();

  /// Directory path: assets/icon/notification_icon
  $AssetsIconNotificationIconGen get notificationIcon =>
      const $AssetsIconNotificationIconGen();
}

class $AssetsIconAppbarIconGen {
  const $AssetsIconAppbarIconGen();

  /// File path: assets/icon/appbar_icon/back_icon.png
  AssetGenImage get backIcon =>
      const AssetGenImage('assets/icon/appbar_icon/back_icon.png');

  /// File path: assets/icon/appbar_icon/more_grey.png
  AssetGenImage get moreGrey =>
      const AssetGenImage('assets/icon/appbar_icon/more_grey.png');

  /// List of all assets
  List<AssetGenImage> get values => [backIcon, moreGrey];
}

class $AssetsIconCommunityIconGen {
  const $AssetsIconCommunityIconGen();

  /// File path: assets/icon/community_icon/comment.png
  AssetGenImage get comment =>
      const AssetGenImage('assets/icon/community_icon/comment.png');

  /// File path: assets/icon/community_icon/heart.png
  AssetGenImage get heart =>
      const AssetGenImage('assets/icon/community_icon/heart.png');

  /// File path: assets/icon/community_icon/heart_border.png
  AssetGenImage get heartBorder =>
      const AssetGenImage('assets/icon/community_icon/heart_border.png');

  /// List of all assets
  List<AssetGenImage> get values => [comment, heart, heartBorder];
}

class $AssetsIconNotificationIconGen {
  const $AssetsIconNotificationIconGen();

  /// File path: assets/icon/notification_icon/banner_check.png
  AssetGenImage get bannerCheck =>
      const AssetGenImage('assets/icon/notification_icon/banner_check.png');

  /// File path: assets/icon/notification_icon/noti_icon.png
  AssetGenImage get notiIcon =>
      const AssetGenImage('assets/icon/notification_icon/noti_icon.png');

  /// File path: assets/icon/notification_icon/notification_dialog_banner.png
  AssetGenImage get notificationDialogBanner => const AssetGenImage(
      'assets/icon/notification_icon/notification_dialog_banner.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [bannerCheck, notiIcon, notificationDialogBanner];
}

class Assets {
  Assets._();

  static const $AssetsIconGen icon = $AssetsIconGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
