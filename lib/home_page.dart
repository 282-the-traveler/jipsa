import 'package:flutter/material.dart';
import 'package:jipsa/screens/camera_screen.dart';
import 'package:jipsa/screens/feed_screen.dart';
import 'package:jipsa/screens/profile_screen.dart';
import 'package:permission_handler/permission_handler.dart';

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

  Future<dynamic> _openCamera() async {
    if (await checkIfPermissionGranted(context)) {
      return Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CameraScreen(),
        ),
      );
    } else {
      SnackBar snackBar = SnackBar(
        content: Text(
          'Please permit to use camera and microphone.',
        ),
        action: SnackBarAction(
          label: 'OK',
          onPressed: (){
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<bool> checkIfPermissionGranted(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.camera, Permission.microphone].request();
    bool permitted = true;

    statuses.forEach((permission, permissionStatus) {
      if (!permissionStatus.isGranted) {
        permitted = false;
      }
    });
    return permitted;
  }
}
