import 'package:elements/tools/utils.dart';
import 'package:flutter/material.dart';

class Divider extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets margin;

  const Divider({
    Key key,
    this.width = 70,
    this.height = 2,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin ?? EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.headline2.color,
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
      ),
    );
  }
}