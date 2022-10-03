import 'package:flutter/material.dart';
import 'package:jipsa/widgets/fade_stack.dart';
import 'package:jipsa/widgets/signin_form.dart';
import 'package:jipsa/widgets/signup_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selectedForm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            FadeStack(selectedForm: selectedForm),
            const Divider(),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 40,
              child: Container(
                color: Colors.white,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (selectedForm == 0) {
                        selectedForm = 1;
                      } else {
                        selectedForm = 0;
                      }
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                      text: (selectedForm == 0)
                          ? 'Already have an account? '
                          : 'Don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: (selectedForm == 0) ? 'Sign In' : 'Sign Up',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
