// singlechildscrollview - для скролу

import 'package:flutter/material.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState();

  final Color loginbackground = const Color.fromARGB(255, 200, 162, 200);

  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginbackground,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/refrigerator.png',
                width: 120,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Pocket Fridge",
                style: textStyleH1,
              ),
              const SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 182, 141, 182),
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const TextField(
                    style: textStyleInput,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16.0),
                      border: InputBorder.none,
                      hintText: "Login or E-mail",
                      hintStyle: textStyleInput,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 182, 141, 182),
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextField(
                    obscureText: _isObscured,
                    style: textStyleInput,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: textStyleInput,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscured ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home'); // sign in function
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(205, 144, 122, 255),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.65, 40),
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Sign In', style: textStyleSign),
              ),
              const SizedBox(
                height: 48,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "First time with Pocket Fridge?",
                    style: textStyleSmall,
                  ),
                  SizedBox(width: 4),
                  Text("Register Now", style: textStyleReg)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
