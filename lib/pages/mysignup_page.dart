// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:prayerrecorder/components/mysignup_form.dart';

class MySignUpPage extends StatefulWidget {
  final void Function() toLoginPage;

  const MySignUpPage({super.key, required this.toLoginPage});

  @override
  State<MySignUpPage> createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.3,
          ),
          child: Card(
            color: Colors.white,
            elevation: 10,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/app-logo.png",
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "CREATE ACCOUNT",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  const MySignUpForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account?  ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.toLoginPage,
                        child: Text(
                          "Login Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
