// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:prayerrecorder/components/googlelogin_btn.dart';
import 'package:prayerrecorder/components/mylogin_form.dart';

class MyLoginPage extends StatelessWidget {
  final void Function() toSignUpPage;

  const MyLoginPage({
    super.key,
    required this.toSignUpPage,
  });

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
                    "Welcome back, We missed you a lot !!!.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  const MyLoginForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not a member?  ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: toSignUpPage,
                        child: Text(
                          "Register Now",
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
                    height: 20,
                  ),
                  const GoogleloginBtn(),
                  const SizedBox(
                    height: 15,
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
