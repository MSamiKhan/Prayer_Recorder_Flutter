import 'package:flutter/material.dart';
import 'package:prayerrecorder/pages/mylogin_page.dart';

class MySignUpPage extends StatefulWidget {
  const MySignUpPage({super.key});

  @override
  State<MySignUpPage> createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confpasswordController = TextEditingController();
  GlobalKey<FormState> _signupformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "PRAYER RECORDER",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: size.height * 0.1,
            horizontal: size.width * 0.3,
          ),
          child: Card(
            color: Colors.white,
            elevation: 10,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Form(
              key: _signupformkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "CREATE ACCOUNT",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (email) {
                        if (email == "") {
                          return "Please enter the email.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "user@example.com",
                        label: const Text("Email"),
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 1.5),
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
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 1.5),
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
                      controller: _confpasswordController,
                      validator: (confpassword) {
                        if (confpassword == "") {
                          return "Please enter the Confirm Password.";
                        } else if (confpassword != _passwordController.text) {
                          return "New & Confirm Password didn't match.";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "New & Confirm Password must match.",
                        label: const Text("Confirm Password"),
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(width: 1.5),
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
                    onTap: () {},
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
                        "SIGN UP",
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MyLoginPage(),
                            ),
                          );
                        },
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
