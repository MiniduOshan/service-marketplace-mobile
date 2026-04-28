import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/phone_login_screen.dart';
import 'screens/otp_screen.dart';
import 'screens/forgot_password_screen.dart';

void main() {
  runApp(const SkilledLKApp());
}

class SkilledLKApp extends StatelessWidget {
  const SkilledLKApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkilledLK',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006D44),
          primary: const Color(0xFF006D44),
        ),
      ),
      // Starts the app on the Onboarding flow
      home: const OnboardingScreen(),

      // Route table for easy navigation
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/phone-login': (context) => const PhoneLoginScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}