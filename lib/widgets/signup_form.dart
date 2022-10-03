import 'package:flutter/material.dart';
import 'package:jipsa/constants/common_size.dart';
import 'package:jipsa/home_page.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          common_gap,
        ),
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              SizedBox(
                height: common_l_gap,
              ),
              Image.asset(
                'assets/images/insta_text_logo.png',
              ),
              TextFormField(
                cursorColor: Colors.grey,
                validator: (text) {
                  if (text!.isNotEmpty &&
                      text.contains('@') &&
                      text.contains('.')) {
                    return null;
                  } else {
                    return 'check your email address.';
                  }
                },
                controller: _emailController,
                decoration: _textInputDecor('Email'),
              ),
              SizedBox(
                height: common_l_gap,
              ),
              TextFormField(
                cursorColor: Colors.grey,
                validator: (text) {
                  if (text!.isNotEmpty && text.length >= 8) {
                    return null;
                  } else {
                    return 'check your password if it has more than 8 characters.';
                  }
                },
                obscureText: true,
                controller: _passwordController,
                decoration: _textInputDecor('Password'),
              ),
              SizedBox(
                height: common_l_gap,
              ),
              TextFormField(
                cursorColor: Colors.grey,
                validator: (text) {
                  if (text!.isNotEmpty && text.length >= 8) {
                    if (text == _passwordController.text) {
                      return null;
                    } else {
                      return 'check your confirm password if it is same with the password.';
                    }
                  } else {
                    return 'check your confirm password if it has more than 8 characters.';
                  }
                },
                obscureText: true,
                controller: _confirmPasswordController,
                decoration: _textInputDecor('Confirm Password'),
              ),
              SizedBox(
                height: common_l_gap,
              ),
              _submitButton(context),
              _orDivider(),
              _loginWithFacebookButton(),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _loginWithFacebookButton() {
    return InkWell(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage(
                      'assets/images/facebook.png',
                    ),
                    color: Colors.blue,
                  ),
                  Text(
                    '  Login with Facebook',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            );
  }

  ElevatedButton _submitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_globalKey.currentState!.validate()) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }
      },
      child: Text(
        'Join',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(150, 50),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
      ),
    );
  }

  Stack _orDivider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 50,
        ),
        Divider(
          height: 5,
          color: Colors.grey,
        ),
        Container(
          color: Colors.white,
          child: Text(
            '  OR  ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }

  InputDecoration _textInputDecor(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[100],
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(
          common_s_gap,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(
          common_s_gap,
        ),
      ),
    );
  }
}
