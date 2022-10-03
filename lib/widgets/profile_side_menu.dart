import 'package:flutter/material.dart';
import 'package:jipsa/screens/auth_screen.dart';

class ProfileSideMenu extends StatelessWidget {
  double menuWidth;
  ProfileSideMenu(this.menuWidth, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: menuWidth,
      child: ListView(
        children: [
          ListTile(
            title: Text(
              'Setting',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.black87,
            ),
            title: Text(
              'Sign out',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => AuthScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
