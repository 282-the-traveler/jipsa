import 'package:flutter/material.dart';
import 'package:jipsa/constants/common_size.dart';
import 'package:jipsa/widgets/profile_body.dart';
import 'package:jipsa/widgets/profile_side_menu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final duration = const Duration(
    milliseconds: 300,
  );
  double bodyXPosition = 0;

  MenuStatus _menuStatus = MenuStatus.closed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double menuXPosition = size.width;
    double menuSize = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          AnimatedContainer(
            duration: duration,
            curve: Curves.fastOutSlowIn,
            transform: Matrix4.translationValues(bodyXPosition, 0, 0),
            child: ProfileBody(
              onMenuChanged: () {
                setState(() {
                  _menuStatus = (_menuStatus == MenuStatus.closed)
                      ? MenuStatus.open
                      : MenuStatus.closed;
                  switch (_menuStatus) {
                    case MenuStatus.open:
                      bodyXPosition = -menuSize;
                      menuXPosition = size.width - menuSize;
                      break;
                    case MenuStatus.closed:
                      bodyXPosition = 0;
                      menuXPosition = size.width;
                      break;
                  }
                });
              },
            ),
          ),
          AnimatedContainer(
            transform: Matrix4.translationValues(menuXPosition, 0, 0),
            duration: duration,
            child: ProfileSideMenu(menuSize),
          ),
        ],
      ),
    );
  }
}

enum MenuStatus { open, closed }
