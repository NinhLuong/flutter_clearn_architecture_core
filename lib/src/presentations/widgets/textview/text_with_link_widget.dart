import 'package:cct_core/src/utils/common_utils/url_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextWithLinkWidget extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;

  const TextWithLinkWidget(
      {super.key, required this.text, required this.textStyle});

  @override
  State<TextWithLinkWidget> createState() => _TextWithLinkWidgetState();
}

class _TextWithLinkWidgetState extends State<TextWithLinkWidget> {
  RegExp urlRegExp = RegExp(
    r'https://link.concuatui.com/\S+',
    caseSensitive: false,
  );

  List<InlineSpan> linkify(String text) {
    final List<InlineSpan> list = <InlineSpan>[];

    widget.text.splitMapJoin(
      urlRegExp,
      onMatch: (Match match) {
        list.add(
          TextSpan(
            text: match.group(0),
            style: widget.textStyle!.copyWith(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                UrlUtils.openLink(match.group(0), LaunchMode.inAppWebView);
              },
          ),
        );
        return "";
      },
      onNonMatch: (String text) {
        list.add(
          TextSpan(text: text, style: widget.textStyle),
        );
        return "";
      },
    );

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        textAlign: TextAlign.justify, TextSpan(children: linkify(widget.text)));
  }
}
