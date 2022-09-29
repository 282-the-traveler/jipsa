import 'package:flutter/material.dart';
import 'package:jipsa/widgets/signin_form.dart';
import 'package:jipsa/widgets/signup_form.dart';

class FadeStack extends StatefulWidget {
  int selectedForm = 0;

  FadeStack({Key? key, required this.selectedForm}) : super(key: key);

  @override
  State<FadeStack> createState() => _FadeStackState();
}

class _FadeStackState extends State<FadeStack>
    with SingleTickerProviderStateMixin {
  List<Widget> form = [
    SignUpForm(),
    SignInForm(),
  ];
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant FadeStack oldWidget) {
    if (widget.selectedForm != oldWidget.selectedForm) {
      _animationController.forward(
        from: 0.0,
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: IndexedStack(
        index: widget.selectedForm,
        children: form,
      ),
    );
  }
}
