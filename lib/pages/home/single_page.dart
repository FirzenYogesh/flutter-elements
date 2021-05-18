import 'package:flutter/material.dart';

class SinglePageHome extends StatelessWidget {
  final Widget title;
  final Widget leadingButton;
  final List<Widget> actions;
  final Widget page;

  const SinglePageHome({
    Key key,
    this.title,
    this.page,
    this.leadingButton,
    this.actions,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: title,
          leading: leadingButton,
          actions: actions,
        ),
        body: SafeArea(child: page));
  }
}
