import 'package:flutter/material.dart';
import 'package:mobile_app/screens/signup_screen.dart';
import 'package:mobile_app/screens/phone_login_screen.dart';
import 'package:mobile_app/screens/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF006D44);
    const Color inputTextColor = Color(0xFF0D1B2A);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1D2125)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "SkilledLK",
          style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Color(0xFF030D16)),
            ),
            const SizedBox(height: 8),
            const Text(
              "Sign in to continue to your account",
              style: TextStyle(fontSize: 16, color: Color(0xFF5D6B78)),
            ),
            const SizedBox(height: 32),

            // Email Address Field
            _buildFieldLabel("Email Address"),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: inputTextColor, fontSize: 16),
              decoration: _inputDecoration(
                hintText: "Enter your email",
                prefixIcon: Icons.email_outlined,
              ),
            ),
            const SizedBox(height: 20),

            // Password Field
            _buildFieldLabel("Password"),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              style: const TextStyle(color: inputTextColor, fontSize: 16),
              decoration: _inputDecoration(
                hintText: "Enter your password",
                prefixIcon: Icons.lock_outline,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    color: const Color(0xFF8D9CA8),
                  ),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
            ),
            
            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()));
                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(color: primaryGreen, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {}, // Implement sign in logic
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            // OR Separator
            _buildOrSeparator(),
            const SizedBox(height: 24),

            // Phone Login Button
            _buildSocialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const PhoneLoginScreen()));
              },
              icon: Icons.phone_android_outlined,
              label: "Continue with Phone Number",
            ),
            const SizedBox(height: 16),

            // Google Login Button
            _buildSocialButton(
              onPressed: () {}, // Implement Google sign in
              imageAsset: 'assets/images/google_logo.png', // Add this asset!
              label: "Continue with Google",
            ),
            const SizedBox(height: 32),

            // Create Account Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("New to SkilledLK?", style: TextStyle(color: Color(0xFF5D6B78), fontSize: 16)),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen()));
                  },
                  child: const Text(
                    "Create an account",
                    style: TextStyle(color: primaryGreen, fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Helper Methods
  Widget _buildFieldLabel(String label) {
    return Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1D2125)));
  }

  InputDecoration _inputDecoration({required String hintText, required IconData prefixIcon, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color(0xFF8D9CA8), fontSize: 16),
      filled: true,
      fillColor: const Color(0xFFF6F8F9),
      prefixIcon: Icon(prefixIcon, color: const Color(0xFF8D9CA8)),
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF006D44), width: 1.5),
      ),
    );
  }

  Widget _buildOrSeparator() {
    return Row(
      children: const [
        Expanded(child: Divider(color: Color(0xFFC8D1D8))),
        Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("OR", style: TextStyle(color: Color(0xFF8D9CA8), fontWeight: FontWeight.bold))),
        Expanded(child: Divider(color: Color(0xFFC8D1D8))),
      ],
    );
  }

  Widget _buildSocialButton({required VoidCallback onPressed, IconData? icon, String? imageAsset, required String label}) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFC8D1D8)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, color: const Color(0xFF0D1B2A), size: 24),
            if (imageAsset != null) Image.asset(imageAsset, height: 24),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(color: Color(0xFF0D1B2A), fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}