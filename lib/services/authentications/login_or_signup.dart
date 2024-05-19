import 'package:flutter/material.dart';
import 'package:prayerrecorder/pages/mylogin_page.dart';
import 'package:prayerrecorder/pages/mysignup_page.dart';

class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key});

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return MyLoginPage(
        toSignUpPage: togglePages,
      );
    } else {
      return MySignUpPage(
        toLoginPage: togglePages,
      );
    }
  }
}
