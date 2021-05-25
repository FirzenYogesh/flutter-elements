import 'package:elements/tools/utils.dart';
import 'package:flutter/material.dart';

class SinglePageHome extends StatelessWidget {
  final Widget title;
  final Widget leadingButton;
  final List<Widget> actions;
  final Widget page;
  final AppBar appBar;

  const SinglePageHome({
    Key key,
    this.title,
    this.page,
    this.leadingButton,
    this.actions,
    this.appBar,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var appBar = this.appBar;
    if (Utils.isFalsy(appBar)) {
      appBar = AppBar(
        title: title,
        leading: leadingButton,
        actions: actions,
      );
    }
    return Scaffold(
        appBar: appBar,
        body: SafeArea(
          child: Utils.isTruthy(page)
              ? page
              : Center(child: Text('Single Page Application')),
        ));
  }
}
