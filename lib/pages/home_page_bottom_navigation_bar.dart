import 'package:flutter/material.dart';

class HomePageBottomNavigationBar extends StatefulWidget {
  final List<BottomNavigationBarItem> items;
  final BottomNavigationBarType bottomNavigationBarType;
  final List<Widget> pages;
  final AppBar appBar;
  final Color selectedItemColor;

  const HomePageBottomNavigationBar({
    Key key,
    this.items,
    this.pages,
    this.bottomNavigationBarType,
    this.appBar,
    this.selectedItemColor,
  }) : super(key: key);
  @override
  _HomePageBottomNavigationBar createState() => _HomePageBottomNavigationBar();
}

class _HomePageBottomNavigationBar extends State<HomePageBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items == null || widget.items.isEmpty) {
      throw Exception("HomePageBottomNavigationBar: Missing items");
    }
    if (widget.pages != null && widget.items.length != widget.pages.length) {
      throw Exception(
          "HomePageBottomNavigationBar: Pages and Items count doesn't match");
    }
    return Scaffold(
      appBar: widget.appBar,
      body: SafeArea(
          child: widget.pages != null
              ? widget.pages[_selectedIndex]
              : Center(child: Text("Page $_selectedIndex"))),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: widget.selectedItemColor != null
            ? widget.selectedItemColor
            : Theme.of(context).primaryColor,
        items: widget.items,
        type: widget.bottomNavigationBarType != null
            ? widget.bottomNavigationBarType
            : BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
