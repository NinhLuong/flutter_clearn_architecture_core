// @author ThinhNguyen
// 14:55 21/5/24

import 'package:cct_config/cct_config.dart';
import 'package:cct_core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MessagingButton extends StatelessWidget {
  final Function() onTap;
  final int? answer;
  final bool isVertical;

  const MessagingButton({
    super.key,
    required this.onTap,
    this.answer,
    this.isVertical = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: isVertical
          ? Column(
              children: [
                Assets.icon.communityIcon.comment.image(
                  width: 20,
                  height: 20,
                  color: AppColors.grayWarm700,
                ),
                const SizedBox(height: 4),
                if (answer != null && answer! > 0)
                  Text(
                    answer.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
              ],
            )
          : Row(
              children: [
                if (answer != null && answer! > 0)
                  Text(
                    answer.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                const SizedBox(width: 4),
                Assets.icon.communityIcon.comment.image(
                  width: 20,
                  height: 20,
                  color: AppColors.grayWarm700,
                ),
              ],
            ),
    );
  }
}
