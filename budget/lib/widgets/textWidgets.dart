import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TextFont extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? textColor;
  final TextAlign textAlign;
  final int? maxLines;
  final bool fixParagraphMargin;
  final bool? shadow;
  final bool autoSizeText;
  final double? minFontSize;
  final double? maxFontSize;
  final TextOverflow? overflow;
  final bool? softWrap;

  const TextFont({
    Key? key,
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.textColor,
    this.maxLines = null,
    this.fixParagraphMargin = false,
    this.shadow = false,
    this.autoSizeText = false,
    this.maxFontSize,
    this.minFontSize,
    this.overflow,
    this.softWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var finalTextColor;
    if (this.textColor == null) {
      finalTextColor = Theme.of(context).colorScheme.black;
    } else {
      finalTextColor = textColor;
    }
    final TextStyle textStyle = TextStyle(
      fontWeight: this.fontWeight,
      fontSize: this.fontSize,
      fontFamily: 'Avenir',
      color: finalTextColor,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.double,
      decorationColor: Color(0x00FFFFFF),
      overflow: overflow,
      shadows: shadow == true
          ? [
              Shadow(
                offset: Offset(0.0, 0.5),
                blurRadius: 8.0,
                color: Color(0x65000000),
              ),
            ]
          : [],
    );
    return Transform.translate(
      offset: Offset(0, this.fontSize * 0.1),
      child: autoSizeText
          ? AutoSizeText(
              "$text",
              maxLines: maxLines,
              textAlign: textAlign,
              overflow: overflow ?? TextOverflow.ellipsis,
              style: textStyle,
              minFontSize: minFontSize ?? fontSize - 10,
              maxFontSize: maxFontSize ?? fontSize + 10,
              softWrap: softWrap,
            )
          : Text(
              "$text",
              maxLines: maxLines,
              textAlign: textAlign,
              overflow: overflow ?? TextOverflow.ellipsis,
              style: textStyle,
              softWrap: softWrap,
            ),
    );
  }
}

class TextHeader extends StatelessWidget {
  const TextHeader({required this.text, Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18.0, right: 18, top: 10, bottom: 5),
        child: TextFont(
          text: text,
          fontSize: 33,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
