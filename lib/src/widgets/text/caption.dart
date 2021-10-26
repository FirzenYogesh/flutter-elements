import 'package:flutter/material.dart';

class TextCaption extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  const TextCaption(
    this.text, {
    Key? key,
    this.textAlign,
    this.textStyle,
    this.maxLines,
    this.textOverflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Text(
        text,
        maxLines: maxLines,
        overflow: textOverflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textDirection: textDirection,
        textHeightBehavior: textHeightBehavior,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.caption?.merge(textStyle),
      );
}
