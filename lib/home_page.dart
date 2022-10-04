import 'dart:html';

import 'package:flutter/material.dart';
import 'package:jipsa/screens/camera_screen.dart';
import 'package:jipsa/screens/feed_screen.dart';
import 'package:jipsa/screens/profile_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'text',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'text',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: 'text',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'text',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'text',
    ),
  ];

  int _selectedIndex = 0;

  static List<Widget> _screens = <Widget>[
    FeedScreen(),
    Container(color: Colors.greenAccent),
    Container(color: Colors.blueAccent),
    Container(color: Colors.purpleAccent),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: btmNavItems,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black87,
        currentIndex: _selectedIndex,
        onTap: _onBtmItemClick,
      ),
    );
  }

  void _onBtmItemClick(int index) {
    switch (index) {
      case 2:
        _openCamera();
        break;
      default:
        setState(() {
          _selectedIndex = index;
        });
    }
  }

  Future<dynamic> _openCamera() {
    return Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CameraScreen(),
        ),
      );
  }
}
