import 'package:flutter/material.dart';

import 'Screens/welcome_screen.dart'; // Import SignInScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        primaryColor: Colors.white,
        useMaterial3: true,
      ),
      home: const WelcomeScreen(), // Start with SignInScreen
    );
  }
}
