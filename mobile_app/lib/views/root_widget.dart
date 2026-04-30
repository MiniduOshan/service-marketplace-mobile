import 'package:flutter/material.dart';
import 'home_screen.dart'; // Path to Home Screen.png
import 'onboarding_screen.dart'; // Path to Onboarding flow
import 'worker_dashboard.dart'; // Path to Worker Dashboard.png
import '../controllers/auth_controller.dart';
import '../models/app_user.dart';


class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppUser?>(
      valueListenable: authController.authStateNotifier,

      builder: (context, user, _) {
        
        // 1. User is NOT logged in - Standard Onboarding Flow
        if (user == null) {
          return const OnboardingScreen();
        }

        // 2. User IS logged in - Check Role and redirect accordingly
        if (user.role == UserRole.worker) {
          return const WorkerDashboard(); // Redirects to Worker Dashboard.png
        } else {
          return const HomeScreen(); // Redirects to User Dashboard (Home Screen.png)
        }
      },
    );

  }
}