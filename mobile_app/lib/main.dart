import 'package:flutter/material.dart';
import 'views/root_widget.dart'; // contains AuthWrapper


// Importing existing screens for routes
import 'views/welcome_screen.dart';
import 'views/login_screen.dart';
import 'views/signup_screen.dart';
import 'views/phone_login_screen.dart';
import 'views/forgot_password_screen.dart';


void main() {
  runApp(const SkilledLKApp());
}

class SkilledLKApp extends StatelessWidget {
  const SkilledLKApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Primary SkilledLK Green color
    const Color primaryGreen = Color(0xFF006D44);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkilledLK',
      
      // Global Theme Data from Figma Green (#006D44)
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryGreen,
          primary: primaryGreen,
        ),
        scaffoldBackgroundColor: Colors.white, // Standard white background
      ),

      // NEW FLOW: The app now starts at AuthWrapper
      // This widget dynamically shows Onboarding, Home, or WorkerDashboard
      home: const AuthWrapper(),


      // Standard Route table for explicit screen navigation (pushNamed)
      // Flows like Welcome Screen Role selection are standard routes.
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/phone-login': (context) => const PhoneLoginScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        // Add more specific routes as needed
      },
    );

  }
}