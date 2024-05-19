import 'package:flutter/material.dart';
import 'package:prayerrecorder/services/authentications/auth_service.dart';

class GoogleloginBtn extends StatelessWidget {
  const GoogleloginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthService authService = AuthService();

    return GestureDetector(
      onTap: () => authService.signInWithGoogle,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.07,
          vertical: size.height * 0.014,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03,
          vertical: size.height * 0.02,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/google.png",
              height: 25,
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              "Continue with Google",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
