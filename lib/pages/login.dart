import 'package:flutter/material.dart';
import 'package:pocket_fridge/styles/textsStyle.dart';
import 'package:flutter/gestures.dart';
import 'package:pocket_fridge/pages/registration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> signIn(Map<String, dynamic> data) async {
  final Uri url = Uri.parse('http://26.136.102.158:8080/checkPassword').replace(
      queryParameters: {'login': data['login'], 'password': data['password']});

  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print('GET request successful');
      print('Response data: ${response.body}');

      String responseString = response.body.toLowerCase();
      bool isAuthenticated = responseString == 'true';

      if (isAuthenticated) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userLogin', data['login']);
        return true;
      } else if (responseString == 'false') {
        return false;
      } else {
        // Обробка невідомого значення, якщо не "true" і не "false"
        print('Unexpected response from the server: $responseString');
        return false;
      }
    } else {
      print('GET request failed with status: ${response.statusCode}');
      return false;
    }
  } catch (error) {
    print('An error occurred: $error');
    return false;
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState();

  final Color loginbackground = const Color.fromARGB(255, 200, 162, 200);

  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();

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
                  child: TextFormField(
                    controller: login,
                    style: textStyleInput,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16.0),
                      border: InputBorder.none,
                      hintText: "Login",
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
                  child: TextFormField(
                    controller: password,
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
                onPressed: () async {
                  String loginsent = login.text;
                  String passwordsent = password.text;
                  var data = {
                    "login": loginsent,
                    "password": passwordsent,
                  };

                  bool isAuthenticated = await signIn(data);

                  if (isAuthenticated) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Container(
                          padding: const EdgeInsets.all(16),
                          height: 90,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Authentication failed...",
                                style: textStyleSign2,
                              ),
                              Text(
                                "Please check your credentials",
                                style: textStyleSmall2,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 5),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                    );
                  }
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "First time with Pocket Fridge?",
                    style: textStyleSmall,
                  ),
                  const SizedBox(width: 4),
                  RichText(
                    text: TextSpan(
                      text: '',
                      style: textStyleReg,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Register Now',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationPage()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
