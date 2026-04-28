import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  // --- HELPER METHODS (These fix your errors) ---
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
    return const Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFC8D1D8))),
        Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("OR", style: TextStyle(color: Color(0xFF8D9CA8), fontWeight: FontWeight.bold))),
        Expanded(child: Divider(color: Color(0xFFC8D1D8))),
      ],
    );
  }

  Widget _buildSocialButton({required VoidCallback onPressed, String? imageAsset, required String label}) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFC8D1D8)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageAsset != null) Image.asset(imageAsset, height: 24),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(color: Color(0xFF0D1B2A), fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        title: const Text("SkilledLK", style: TextStyle(color: Color(0xFF006D44), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Create an account", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 32),
            TextField(controller: _nameController, decoration: _inputDecoration(hintText: "Full Name", prefixIcon: Icons.person_outline)),
            const SizedBox(height: 20),
            TextField(controller: _emailController, decoration: _inputDecoration(hintText: "Email Address", prefixIcon: Icons.email_outlined)),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: _inputDecoration(
                hintText: "Password", 
                prefixIcon: Icons.lock_outline,
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF006D44), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
                child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            const SizedBox(height: 24),
            _buildOrSeparator(),
            const SizedBox(height: 24),
            _buildSocialButton(onPressed: () {}, imageAsset: 'assets/images/google_logo.png', label: "Sign up with Google"),
          ],
        ),
      ),
    );
  }
}