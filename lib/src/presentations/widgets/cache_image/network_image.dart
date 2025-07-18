import 'package:cached_network_image/cached_network_image.dart';
import 'package:cct_core/cct_core.dart';
import 'package:flutter/material.dart';

class NetWorkImage extends StatelessWidget {
  final bool isLocalImage;
  final bool hasSize;
  final AttachmentEntity imageSrc;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry margin;
  final double? width;
  final double? height;
  final String imageDescription;

  const NetWorkImage(
      {super.key,
      required this.imageSrc,
      required this.borderRadius,
      required this.margin,
      this.width,
      this.height,
      this.isLocalImage = false,
      this.hasSize = true,
      this.imageDescription = ""});

  @override
  Widget build(BuildContext context) {
    return isLocalImage
        ? Image.asset(
            imageSrc.getAttachmentUrl(),
            width: width,
            height: height,
          )
        : hasSize
            ? InkWell(
                onTap: () {
                  //TODO: And routes to view fullscreen image
                },
                child: Hero(
                  tag: imageSrc,
                  child: CachedNetworkImage(
                    imageUrl: imageSrc.getAttachmentUrl(),
                    imageBuilder: (context, imageProvider) => Container(
                      clipBehavior: Clip.antiAlias,
                      margin: margin,
                      width: width!,
                      height: height!,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/icon/image_holder.jpg",
                      width: width!,
                      height: height!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ))
            : InkWell(
                onTap: () {
                  //TODO: And routes to view fullscreen image
                },
                child: Container(
                  margin: margin,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                  ),
                  child: Hero(
                    tag: imageSrc,
                    child: CachedNetworkImage(
                      imageUrl: imageSrc.getAttachmentUrl(),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/icon/image_holder.jpg",
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              );
  }
}
