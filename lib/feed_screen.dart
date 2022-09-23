import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jipsa',
          style: TextStyle(
            fontFamily: 'Instafont',
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
