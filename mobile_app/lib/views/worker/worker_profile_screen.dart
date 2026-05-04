import 'package:flutter/material.dart';

class WorkerProfileScreen extends StatelessWidget {
  const WorkerProfileScreen({super.key});

  static const Color primaryGreen = Color(0xFF006D44);
  static const Color scaffoldBg = Color(0xFFF8FAFC);
  static const Color accentBlue = Color(0xFF1E293B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: primaryGreen,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 25),
            _buildPersonalDetailsSection(),
            const SizedBox(height: 20),
            _buildStatsSection(),
            const SizedBox(height: 25),
            _buildServicesSection(),
            const SizedBox(height: 25),
            _buildPortfolioSection(),
            const SizedBox(height: 25),
            _buildRatingsSection(),
            const SizedBox(height: 25),
            _buildAccountSettingsSection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: primaryGreen,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  "KS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: primaryGreen,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(Icons.edit, color: Colors.white, size: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const Text(
          "Kasun Silva",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: accentBlue,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.verified, color: primaryGreen, size: 18),
            SizedBox(width: 5),
            Text(
              "VERIFIED PROFESSIONAL",
              style: TextStyle(
                color: primaryGreen,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPersonalDetailsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Personal Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: accentBlue,
                ),
              ),
              Text(
                "Manage",
                style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Profile Completeness",
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              Text(
                "85%",
                style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.85,
              backgroundColor: primaryGreen.withOpacity(0.1),
              valueColor: const AlwaysStoppedAnimation<Color>(primaryGreen),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Complete your profile to earn more trust and attract 3x more clients.",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 20),
          _buildChecklistItem("ID Verification", true),
          _buildChecklistItem("Phone Verified", true),
          _buildChecklistItem("Certificates", false, actionText: "UPLOAD"),
        ],
      ),
    );
  }

  Widget _buildChecklistItem(String title, bool isDone, {String? actionText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            isDone ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isDone ? primaryGreen : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isDone ? accentBlue : Colors.grey,
              ),
            ),
          ),
          Text(
            actionText ?? (isDone ? "DONE" : ""),
            style: TextStyle(
              color: isDone ? primaryGreen : primaryGreen,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildStatCard("TOTAL EARNINGS", "Rs. 45.2k", Colors.teal),
          const SizedBox(width: 12),
          _buildStatCard("JOBS DONE", "128", Colors.blue),
          const SizedBox(width: 12),
          _buildStatCard("PROFILE VIEWS", "422", Colors.orange),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Your Services",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: accentBlue,
                ),
              ),
              Text(
                "Manage",
                style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        _buildServiceTile("Interior Painting", "Rs. 2500 / hr", Icons.format_paint, true),
        _buildServiceTile("Leak Repair", "Rs. 1800 / task", Icons.plumbing, true),
      ],
    );
  }

  Widget _buildServiceTile(String name, String price, IconData icon, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: primaryGreen),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: accentBlue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          Switch(
            value: isActive,
            onChanged: (v) {},
            activeColor: Colors.white,
            activeTrackColor: primaryGreen,
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Portfolio",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: accentBlue,
                ),
              ),
              Text(
                "12 Items",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            children: [
              _buildPortfolioImage('https://images.unsplash.com/photo-1589939705384-5185138a04b9?q=80&w=200&auto=format&fit=crop'),
              _buildPortfolioImage('https://images.unsplash.com/photo-1562259949-e8e7689d7828?q=80&w=200&auto=format&fit=crop'),
              _buildPortfolioImage('https://images.unsplash.com/photo-1604147706480-5163723f2cfc?q=80&w=200&auto=format&fit=crop'),
              _buildAddWorkButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPortfolioImage(String url) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildAddWorkButton() {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: primaryGreen.withOpacity(0.3), style: BorderStyle.solid),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.add_photo_alternate_outlined, color: primaryGreen, size: 30),
          SizedBox(height: 8),
          Text(
            "Add New Work",
            style: TextStyle(
              color: primaryGreen,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Your Ratings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: accentBlue,
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  SizedBox(width: 4),
                  Text(
                    "4.9",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    " (112)",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage('https://i.pravatar.cc/100?u=amara'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Amara Jayasekara",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "2 days ago",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "\"Kasun did an excellent job painting our master bedroom. Very punctual and clean work.\"",
            style: TextStyle(color: accentBlue, fontSize: 14, height: 1.4),
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.reply, size: 16),
            label: const Text("Reply to feedback"),
            style: TextButton.styleFrom(
              foregroundColor: primaryGreen,
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "ACCOUNT SETTINGS",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 15),
        _buildSettingsTile(Icons.notifications_none, "Notification Preferences"),
        _buildSettingsTile(Icons.payment, "Payment Details"),
        _buildSettingsTile(Icons.language, "Language", trailingText: "English"),
        _buildSettingsTile(Icons.help_outline, "Help Center"),
      ],
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, {String? trailingText}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: accentBlue.withOpacity(0.7)),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailingText != null)
              Text(
                trailingText,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            const SizedBox(width: 5),
            const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryGreen,
      unselectedItemColor: Colors.grey,
      currentIndex: 3,
      onTap: (index) {
        if (index == 0) Navigator.pushReplacementNamed(context, '/worker-dashboard');
        if (index == 1) Navigator.pushNamed(context, '/job-requests');
        if (index == 2) Navigator.pushNamed(context, '/worker-wallet');
      },
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: "Dashboard"),
        BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "Jobs"),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: "Earnings"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
