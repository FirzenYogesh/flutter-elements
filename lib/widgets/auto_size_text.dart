import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AutoSizeText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle textStyle;
  final int maxLines;
  final TextOverflow textOverflow;
  final String semanticsLabel;
  final bool softWrap;
  final StrutStyle strutStyle;
  final TextDirection textDirection;
  final TextHeightBehavior textHeightBehavior;
  final double textScaleFactor;
  final TextWidthBasis textWidthBasis;
  final bool isSelectable;

  AutoSizeText(
    this.text, {
    Key key,
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
    this.isSelectable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: isSelectable
          ? SelectableText(
              text,
              maxLines: maxLines,
              strutStyle: strutStyle,
              textDirection: textDirection,
              textHeightBehavior: textHeightBehavior,
              textScaleFactor: textScaleFactor,
              textWidthBasis: textWidthBasis,
              textAlign: textAlign,
              style: textStyle,
            )
          : Text(
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
              style: textStyle,
            ),
    );
  }
}
