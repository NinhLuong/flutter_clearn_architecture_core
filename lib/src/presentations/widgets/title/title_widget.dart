// ThinhNguyen
// 09:47 20/9/24

import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final int maxLines;
  final EdgeInsets margin;

  const TitleWidget(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.margin = const EdgeInsets.symmetric(horizontal: 16)});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: margin,
      child: Text(title,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall),
    );
  }
}
