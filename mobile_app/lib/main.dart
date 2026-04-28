import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart'; // Make sure this matches your file path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkilledLK',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006D44)),
        useMaterial3: true,
      ),
      // This is the key change:
      home: OnboardingScreen(), 
    );
  }
}