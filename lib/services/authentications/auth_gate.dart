import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prayerrecorder/pages/myhome_page.dart';
import 'package:prayerrecorder/services/authentications/login_or_signup.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MyHomePage();
          } else {
            return const LoginOrSignUp();
          }
        },
      ),
    );
  }
}
