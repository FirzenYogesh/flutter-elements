import 'package:elements/elements.dart';
import 'package:flutter/material.dart';

class SimpleAlertDialog extends StatelessWidget {
  final Widget content;
  final String? positiveText;
  final String? neutralText;
  final String? negativeText;
  final String? title;

  final Function()? positiveOnClick;
  final Function()? neutralOnClick;
  final Function()? negativeOnClick;

  const SimpleAlertDialog({
    Key? key,
    required this.content,
    this.positiveText,
    this.neutralText,
    this.negativeText,
    this.title,
    this.positiveOnClick,
    this.neutralOnClick,
    this.negativeOnClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var actions = <Widget>[];
    if (Utils.isTruthy(negativeText)) {
      actions.add(
          TextButton(onPressed: negativeOnClick, child: Text(negativeText!)));
    }
    if (Utils.isTruthy(neutralText)) {
      actions.add(
          TextButton(onPressed: neutralOnClick, child: Text(neutralText!)));
    }
    if (Utils.isTruthy(positiveText)) {
      actions.add(
          TextButton(onPressed: positiveOnClick, child: Text(positiveText!)));
    }
    return AlertDialog(
      actions: actions,
      content: content,
      title: title != null ? Text(title!) : null,
    );
  }
}
