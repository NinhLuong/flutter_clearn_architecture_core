import 'package:cct_core/src/presentations/widgets/textview/text_highlight/text_highlight_custom.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/src/highlighted_word.dart';

class TextHighLight extends StatefulWidget {
  final String text;
  final String wordToHighLight;
  final Color highlightColor;
  final TextStyle textStyle;
  final InlineSpan? prefixIcon;
  final int maxLines;
  final bool needBottomPadding;

  const TextHighLight(
      {super.key,
        required this.text,
        required this.textStyle,
        required this.wordToHighLight,
        required this.highlightColor,
        this.prefixIcon,
        this.maxLines = 10,
        this.needBottomPadding = false});

  @override
  State<TextHighLight> createState() => _TextHighLightState();
}

class _TextHighLightState extends State<TextHighLight> {
  late final List<String> highlightWords;
  final Map<String, HighlightedWord> words = {};

  @override
  void initState() {
    highlightWords = widget.wordToHighLight.split(" ");

    for (var element in highlightWords) {
      words.addAll({
        element: HighlightedWord(
            textStyle: widget.textStyle.copyWith(
              color: widget.highlightColor,
            ))
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.wordToHighLight.isEmpty) {
      return Text(
        widget.text,
        style: widget.textStyle,
      );
    }

    return highlightWord(
        widget.text, widget.wordToHighLight, widget.highlightColor);
  }

  Widget highlightWord(
      String text, String wordToHighlight, Color highlightColor) {
    return TextHighlight(
      text: text,
      words: words,
      textStyle: widget.textStyle,
      prefixIcon: widget.prefixIcon,
      maxLines: widget.maxLines,
      overflow: TextOverflow.ellipsis,
      needBottomPadding: widget.needBottomPadding,
    );
  }
}
