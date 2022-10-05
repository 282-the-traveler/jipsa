import 'package:flutter/material.dart';

class TakePhoto extends StatelessWidget {
  const TakePhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.black,
          width: width,
          height: width,
        ),
        Expanded(
          child: FloatingActionButton(
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
