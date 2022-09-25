import 'package:flutter/material.dart';
import 'package:jipsa/constants/common_size.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  bool selectedLeft = true;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _username(),
                _userbio(),
                _editProfileBtn(),
                _tabBtn(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _tabBtn() {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            icon: ImageIcon(
              AssetImage(
                'assets/images/grid.png',
              ),
              color: selectedLeft ? Colors.black87 : Colors.black26,
            ),
            onPressed: () {
              setState(() {
                selectedLeft = true;
              });
            },
          ),
        ),
        Expanded(
          child: IconButton(
            icon: ImageIcon(
              AssetImage(
                'assets/images/saved.png',
              ),
              color: selectedLeft ? Colors.black26 : Colors.black87,
            ),
            onPressed: () {
              setState(() {
                selectedLeft = false;
              });
            },
          ),
        ),
      ],
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: common_gap,
      ),
      child: SizedBox(
        height: 24,
        child: OutlinedButton(
          onPressed: () {},
          child: Text(
            'Edit profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: common_gap,
      ),
      child: Text(
        'username',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _userbio() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: common_gap,
        vertical: common_xxs_gap,
      ),
      child: Text(
        'bio',
        style: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
