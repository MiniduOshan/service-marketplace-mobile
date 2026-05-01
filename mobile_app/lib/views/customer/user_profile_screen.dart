import 'package:flutter/material.dart';
import '../../controllers/auth_controller.dart'; // To handle logout

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  static const Color primaryGreen = Color(0xFF006D44);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Profile", style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProfileHeader(),
            const SizedBox(height: 30),
            _buildSettingsList(context),
            const SizedBox(height: 20),
            _buildSupportSection(),
            const SizedBox(height: 30),
            _buildLogoutButton(context),
            const SizedBox(height: 20),
            const Text("Version 2.4.1 • SkilledLK Platform", 
              style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 55,
              backgroundColor: primaryGreen,
              child: CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage('https://placeholder.com/150'), // Replace with actual data
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: primaryGreen, shape: BoxShape.circle),
                child: const Icon(Icons.edit_outlined, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text("Nimal Karunaratne", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        const Text("📍 MAHARAGAMA, COLOMBO", style: TextStyle(color: Colors.grey, fontSize: 13, letterSpacing: 1)),
      ],
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          _settingTile(Icons.calendar_today_outlined, "My Bookings", Colors.green.shade50, Colors.green),
          _settingTile(Icons.account_balance_wallet_outlined, "Payment Methods", Colors.teal.shade50, Colors.teal, subtitle: "Visa •••• 1234"),
          _settingTile(Icons.bookmark_border, "Saved Addresses", Colors.blue.shade50, Colors.blue),
          _settingTile(Icons.notifications_none, "Notifications", Colors.orange.shade50, Colors.orange, isSwitch: true),
          _settingTile(Icons.language, "Language", Colors.purple.shade50, Colors.purple, subtitle: "English", isLast: true),
        ],
      ),
    );
  }

  Widget _buildSupportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30, bottom: 10, top: 10),
          child: Text("SUPPORT", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1)),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              _supportTile("Help Center"),
              _supportTile("Contact Support"),
              _supportTile("Terms & Privacy Policy", isLast: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _settingTile(IconData icon, String title, Color bg, Color iconColor, {String? subtitle, bool isSwitch = false, bool isLast = false}) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: iconColor),
          ),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: subtitle != null ? Text(subtitle) : null,
          trailing: isSwitch 
            ? Switch(value: true, onChanged: (v){}, activeThumbColor: primaryGreen) 
            : const Icon(Icons.chevron_right, color: Colors.grey),
        ),
        if (!isLast) const Divider(height: 1, indent: 70),
      ],
    );
  }

  Widget _supportTile(String title, {bool isLast = false}) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        ),
        if (!isLast) const Divider(height: 1, indent: 20),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFE9E9),
          foregroundColor: Colors.red,
          elevation: 0,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () => authController.logOut(), // Clears session and returns to onboarding
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout_rounded),
            SizedBox(width: 10),
            Text("Logout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}