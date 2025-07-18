import 'package:cached_network_image/cached_network_image.dart';
import 'package:cct_core/cct_core.dart';
import 'package:flutter/material.dart';

class ThumbnailImage extends StatelessWidget {
  final bool isLocalImage;
  final bool hasSize;
  final AttachmentEntity imageSrc;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry margin;
  final double? width;
  final double? height;
  final bool originSize;
  final Duration duration;

  const ThumbnailImage(
      {super.key,
      required this.imageSrc,
      required this.borderRadius,
      required this.margin,
      this.width,
      this.height,
      this.isLocalImage = false,
      this.hasSize = true,
      this.originSize = false,
      this.duration = Duration.zero});

  @override
  Widget build(BuildContext context) {
    return isLocalImage
        ? Image.asset(
            imageSrc.getAttachmentUrl(),
            width: width,
            height: height,
          )
        : hasSize
            ? CachedNetworkImage(
                imageUrl: originSize
                    ? imageSrc.getAttachmentUrl()
                    : imageSrc
                        .getAttachmentUrl()
                        .replaceAll("images", "thumbnail"),
                imageBuilder: (context, imageProvider) => AnimatedContainer(
                  duration: duration,
                  margin: margin,
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return CardLoading(
                    height: height!,
                    width: width!,
                  );
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              )
            : AnimatedContainer(
                duration: duration,
                margin: margin,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                ),
                child: CachedNetworkImage(
                  imageUrl: originSize
                      ? imageSrc.getAttachmentUrl()
                      : imageSrc
                          .getAttachmentUrl()
                          .replaceAll("images", "thumbnail"),
                  progressIndicatorBuilder: (context, url, downloadProgress) {
                    return CardLoading(
                      height: height!,
                      width: width!,
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.scaleDown,
                ),
              );
  }
}
