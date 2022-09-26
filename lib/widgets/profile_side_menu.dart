import 'package:flutter/material.dart';

class ProfileSideMenu extends StatelessWidget {
  double menuWidth;

  ProfileSideMenu(this.menuWidth, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: menuWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Setting',
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.black87,
              ),
              title: Text(
                'Sign out',
              ),
            )
          ],
        ),
      ),
    );
  }
}
