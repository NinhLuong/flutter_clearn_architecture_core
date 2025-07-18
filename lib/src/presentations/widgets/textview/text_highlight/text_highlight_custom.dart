// @author ThinhNguyen
// 17:23 8/5/24

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:highlight_text/src/sort.dart';
import 'package:highlight_text/src/text_element.dart';

import 'binding.dart';

/// Defines what occurrence you want to highlight
enum HighlightBinding {
  /// Highlights all occurrences of a word
  all,

  /// Highlights only the first occurrence
  first,

  /// Highlights only the last occurrence
  last,
}

/// TextHighlight will provide you a easy way to display highlighted words on your app
class TextHighlight extends StatelessWidget {
  /// The text you want to show
  final String text;

  /// Map with the word you need to highlight
  final Map<String, HighlightedWord> words;

  /// Split the highlighted word to fit in the same line as the text
  final bool splitOnLongWord;

  /// Change the alignment of the text inside span
  final PlaceholderAlignment spanAlignment;

  /// If it is true, it will highlight the exactly same match
  final bool matchCase;

  /// Change the occurrence of a highlight
  final HighlightBinding binding;

  final TextStyle? textStyle;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int? maxLines;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final InlineSpan? prefixIcon;
  final bool needBottomPadding;

  const TextHighlight(
      {super.key,
      required this.text,
      required this.words,
      this.textStyle,
      this.textAlign = TextAlign.start,
      this.textDirection,
      this.softWrap = true,
      this.overflow = TextOverflow.clip,
      this.textScaleFactor = 1.0,
      this.maxLines,
      this.locale,
      this.strutStyle,
      this.matchCase = false,
      this.binding = HighlightBinding.all,
      this.spanAlignment = PlaceholderAlignment.middle,
      this.splitOnLongWord = false,
      this.prefixIcon,
      this.needBottomPadding = false});

  @override
  Widget build(BuildContext context) {
    final sortedWords = sortAndFilterWords(words.entries.toList());
    final boundWords = _bind(
      sortedWords.map((entry) => entry.key).toList(),
    );

    return Text.rich(
      _buildSpan(sortedWords.map((entry) => entry.value).toList(), boundWords),
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaler: TextScaler.linear(textScaleFactor),
    );
  }

  List<TextElement> _bind(List<String> words) {
    switch (binding) {
      case HighlightBinding.first:
        return firstOccurance(words, text, matchCase);
      case HighlightBinding.last:
        return lastOccurance(words, text, matchCase);
      case HighlightBinding.all:
      default:
        return allOccurance(words, text, matchCase);
    }
  }

  TextSpan _buildSpan(
    List<HighlightedWord> highlightedWords,
    List<TextElement> boundWords,
  ) {
    if (prefixIcon != null) {
      return TextSpan(
        children: inlineSpan(highlightedWords, boundWords)
          ..insert(0, prefixIcon!),
      );
    }
    return TextSpan(children: inlineSpan(highlightedWords, boundWords));
  }

  List<InlineSpan> inlineSpan(
    List<HighlightedWord> highlightedWords,
    List<TextElement> boundWords,
  ) {
    return boundWords
        .map<List<InlineSpan>>((element) {
          if (element is MatchedElement) {
            final index = element.matchedIndex;
            try {
              final highlightedWord = highlightedWords[index];
              String showWord = element.originalText;
              final List<String> splittedWords = [];
              if (splitOnLongWord && showWord.contains(" ")) {
                for (String w in showWord.split(" ")) {
                  splittedWords.addAll([w, " "]);
                }
              } else {
                splittedWords.add(showWord);
              }
              return splittedWords.map((w) {
                if (w == ' ') {
                  return TextSpan(
                    text: '',
                    style: textStyle,
                  );
                }
                return WidgetSpan(
                  alignment: spanAlignment,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: needBottomPadding ? 1 : 0),
                    child: Text(
                      w,
                      style: highlightedWord.textStyle ?? textStyle,
                      textScaler: const TextScaler.linear(1),
                    ),
                  ),
                );
              }).toList();
            } catch (e) {
              if (kDebugMode) {
                print(e);
              }
            }
          }
          return [
            TextSpan(
              text: (element as UnmatchedElement).text,
              style: textStyle,
            )
          ];
        })
        .expand((span) => span)
        .toList();
  }
}
