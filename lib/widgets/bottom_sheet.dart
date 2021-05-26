import 'package:flutter/material.dart';
import 'package:elements/widgets/flexible_divider.dart';

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: FlexibleDivider()),
          child,
        ],
      ),
    );
  }
}
