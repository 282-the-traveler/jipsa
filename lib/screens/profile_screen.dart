import 'package:flutter/material.dart';
import 'package:jipsa/constants/common_size.dart';
import 'package:jipsa/widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appbar(),
            const ProfileBody(),
          ],
        ),
      ),
    );
  }

  Row _appbar() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            '282.the.traveler',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
      ],
    );
  }
}
