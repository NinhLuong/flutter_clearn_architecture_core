import 'package:cct_config/cct_config.dart';
import 'package:flutter/material.dart';

class ReplyButton extends StatelessWidget {
  final Function()? replyButtonCallBack;

  const ReplyButton({super.key, this.replyButtonCallBack});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: replyButtonCallBack,
      child: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
        child: Text(
          AppLocalizations.of(context).reply,
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.bodySmall!.apply(
                color: AppColors.grayWarm500,
              ),
        ),
      ),
    );
  }
}
