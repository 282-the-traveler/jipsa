import 'package:flutter/material.dart';
import 'package:jipsa/constants/material_white.dart';
import 'package:jipsa/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: white,
      ),
    );
  }
}
