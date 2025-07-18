// ThinhNguyen
// 09:09 16/9/24

import 'package:cct_config/cct_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardLoading extends StatelessWidget {
  final BorderRadius? borderRadius;
  final double? width;
  final double height;
  final EdgeInsets? margin;

  const CardLoading({
    super.key,
    this.borderRadius,
    this.width,
    required this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.brand100,
        highlightColor: AppColors.brand50,
        enabled: true,
        child: Container(
          width: width ?? double.infinity,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
        ));
  }
}
