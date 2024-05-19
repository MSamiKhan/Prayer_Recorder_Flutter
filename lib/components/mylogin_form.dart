// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:prayerrecorder/services/authentications/auth_service.dart';

class MyLoginForm extends StatefulWidget {
  const MyLoginForm({super.key});

  @override
  State<MyLoginForm> createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _loginformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _loginformkey,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: TextFormField(
              controller: _emailController,
              validator: (email) {
                if (email!.isEmpty) {
                  return "Please enter the valid email.";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "user@example.com",
                label: const Text("Email"),
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 1.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 1.5,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 1.5,
                  ),
                ),
                fillColor: Theme.of(context).colorScheme.primary,
                filled: true,
              ),
              cursorColor: Colors.black,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: TextFormField(
              controller: _passwordController,
              validator: (password) {
                if (password == "") {
                  return "Please enter the password.";
                } else if (password!.length < 8) {
                  return "Password should be 8 chracters long.";
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: "At least 8 characters long.",
                label: const Text("Password"),
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 1.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 1.5,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 1.5,
                  ),
                ),
                fillColor: Theme.of(context).colorScheme.primary,
                filled: true,
              ),
              cursorColor: Colors.black,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: _login,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.02,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              child: Text(
                "LOG IN",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Future<void> _login() async {
    if (_loginformkey.currentState!.validate()) {
      final String email = _emailController.text;
      final String password = _passwordController.text;
      final AuthService auth = AuthService();

      try {
        await auth.loginwithEmailPassword(email, password);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logged You In 😊'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    }
  }
}
