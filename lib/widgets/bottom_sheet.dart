import 'package:elements/tools/utils.dart';
import 'package:flutter/material.dart';

class BottomSheetView extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const BottomSheetView({
    Key key,
    @required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          child,
        ],
      ),
    );
  }
}
