import 'package:flutter/material.dart';
import 'package:jipsa/widgets/fade_stack.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>{
  int selectedForm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FadeStack(selectedForm: selectedForm),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedForm == 0) {
                    selectedForm = 1;
                  } else {
                    selectedForm = 0;
                  }
                });
              },
              child: Text(
                'Go to sign up',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
