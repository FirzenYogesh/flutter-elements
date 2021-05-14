import 'package:flutter/material.dart';

class HomePageBottomAppBar extends StatefulWidget {
  final List<BottomNavigationBarItem> items;
  final BottomNavigationBarType bottomNavigationBarType;
  final List<Widget> pages;
  final AppBar appBar;

  const HomePageBottomAppBar(
      {Key key,
      this.items,
      this.pages,
      this.bottomNavigationBarType,
      this.appBar})
      : super(key: key);
  @override
  _HomePageBottomAppBar createState() => _HomePageBottomAppBar();
}

class _HomePageBottomAppBar extends State<HomePageBottomAppBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: SafeArea(child: widget.pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: widget.items,
        type: widget.bottomNavigationBarType,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
