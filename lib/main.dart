import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/home.dart';

void main() {
  runApp(const PocketFridge());
}

class PocketFridge extends StatelessWidget {
  const PocketFridge({super.key});

  @override
  Widget build(context) {
     return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
