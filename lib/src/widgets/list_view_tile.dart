import 'package:elements/src/tools/utils.dart';
import 'package:elements/elements.dart';
import 'package:flutter/widgets.dart';

class ListViewTile extends StatelessWidget {
  final Icon? primaryIcon;
  final String title;
  final String? subtitle;
  final String? secondaryText;
  final Icon? secondaryIcon;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const ListViewTile({
    Key? key,
    required this.title,
    this.primaryIcon,
    this.subtitle,
    this.secondaryText,
    this.secondaryIcon,
    this.height,
    this.width,
    this.padding,
    this.margin,
  }) : super(key: key);

  Expanded _getExpanded(Widget widget, int flex) {
    return Expanded(
      flex: flex,
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    var secondaryChildren = <Widget>[];
    var textChildren = <Widget>[];
    if (Utils.isTruthy(primaryIcon)) {
      children.add(_getExpanded(primaryIcon!, 1));
    }

    textChildren.add(_getExpanded(TextH5(title), 2));

    if (Utils.isTruthy(subtitle)) {
      textChildren.add(_getExpanded(TextSubtitle1(subtitle!), 1));
    }

    children.add(_getExpanded(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: textChildren,
        ),
        4));

    if (Utils.isTruthy(secondaryIcon)) {
      secondaryChildren.add(_getExpanded(secondaryIcon!, 1));
    }

    if (Utils.isTruthy(secondaryText)) {
      secondaryChildren.add(_getExpanded(TextBody1(secondaryText!), 1));
    }

    if (secondaryChildren.isNotEmpty) {
      children.add(_getExpanded(
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: secondaryChildren,
          ),
          1));
    }
    return Container(
      height: height ?? 70,
      width: width ?? double.maxFinite,
      margin: margin ?? EdgeInsets.all(10),
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: children,
      ),
    );
  }
}
