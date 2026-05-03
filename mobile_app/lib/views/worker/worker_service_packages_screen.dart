import 'package:flutter/material.dart';
import '../../controllers/auth_controller.dart';

class WorkerServicePackagesScreen extends StatefulWidget {
  const WorkerServicePackagesScreen({super.key});

  @override
  State<WorkerServicePackagesScreen> createState() => _WorkerServicePackagesScreenState();
}

class _WorkerServicePackagesScreenState extends State<WorkerServicePackagesScreen> {
  static const Color primaryGreen = Color(0xFF006D44);
  bool isAgreed = false;
  bool isConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Service Packages", 
          style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: primaryGreen),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildProgressBar(0.75, "Step 4 of 4 — Verification", "75% Complete"),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Set your service packages", 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text("Standard packages help customers book you faster. You can edit these anytime.", 
                    style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 30),
                  
                  _buildStartingServiceCard(),
                  
                  const SizedBox(height: 30),
                  const Text("ADD MORE PACKAGES", 
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF475569), letterSpacing: 1)),
                  const SizedBox(height: 16),
                  
                  _buildAddPackageOption(Icons.home_work_outlined, "Full House / Large Project", "Best for multiple rooms or complete property renovations."),
                  const SizedBox(height: 12),
                  _buildAddPackageOption(Icons.access_time, "Custom Quote / Hourly", "For maintenance or specialized tasks billed by duration."),
                  const SizedBox(height: 20),
                  _buildAddCustomBtn(),
                  
                  const SizedBox(height: 30),
                  _buildLeadPreferenceCard(),
                  
                  const SizedBox(height: 30),
                  _buildCheckboxes(),
                ],
              ),
            ),
          ),
          _buildBottomNav(),
        ],
      ),
    );
  }

  Widget _buildProgressBar(double progress, String step, String percent) {
    return Column(
      children: [
        LinearProgressIndicator(value: progress, backgroundColor: Colors.grey.shade100, color: primaryGreen, minHeight: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(step, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              Text(percent, style: const TextStyle(fontSize: 12, color: primaryGreen, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }

  Widget _buildStartingServiceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.stars, color: primaryGreen, size: 20),
              SizedBox(width: 8),
              Text("BASIC / STARTING SERVICE", 
                style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 0.5)),
            ],
          ),
          const SizedBox(height: 20),
          _buildFieldLabel("Package Name"),
          _buildTextField("Room Painting - Small"),
          const SizedBox(height: 20),
          _buildFieldLabel("Description"),
          _buildTextField("Standard room up to 12x14ft, 2 coats of paint. Primer extra.", maxLines: 3),
          const SizedBox(height: 20),
          _buildFieldLabel("Base Price (LKR)"),
          _buildTextField("15000", prefix: "LKR  "),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(fontSize: 13, color: Colors.grey)),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1, String? prefix}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        prefixText: prefix,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade200)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade200)),
      ),
    );
  }

  Widget _buildAddPackageOption(IconData icon, String title, String sub) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, style: BorderStyle.solid),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCustomBtn() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryGreen, width: 1.5), // Mimicking the dashed look with solid for simplicity
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_circle_outline, color: primaryGreen),
          SizedBox(width: 12),
          Text("Add custom package", style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildLeadPreferenceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline, color: Color(0xFF475569)),
              const SizedBox(width: 12),
              const Expanded(
                child: Text("Lead Fee Preference", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: const Color(0xFFE2E8F0), borderRadius: BorderRadius.circular(20)),
                child: const Text("Pro Subscription", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: primaryGreen)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "SkilledLK offers two ways to receive customer leads. You are currently starting on our Monthly Subscription model which grants unlimited leads. You can switch to Pay-per-lead in your settings later.",
            style: TextStyle(fontSize: 13, color: Color(0xFF64748B), height: 1.5),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _toggleBtn("Subscription", true)),
              const SizedBox(width: 12),
              Expanded(child: _toggleBtn("Pay-per-lead", false)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _toggleBtn(String text, bool isActive) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isActive ? primaryGreen : Colors.grey.shade200),
      ),
      alignment: Alignment.center,
      child: Text(text, style: TextStyle(color: isActive ? primaryGreen : Colors.grey, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildCheckboxes() {
    return Column(
      children: [
        _checkRow("I agree to SkilledLK Professional Terms of Service and Code of Conduct.", isAgreed, (v) => setState(() => isAgreed = v!)),
        const SizedBox(height: 12),
        _checkRow("I confirm all provided documents and details are authentic and reflect my actual professional capacity.", isConfirmed, (v) => setState(() => isConfirmed = v!)),
      ],
    );
  }

  Widget _checkRow(String text, bool val, Function(bool?) onChanged) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24, height: 24,
          child: Checkbox(value: val, onChanged: onChanged, activeColor: primaryGreen, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 14, color: Color(0xFF475569)))),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFFF1F4F9)))),
      child: Row(
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Row(children: [Icon(Icons.chevron_left, color: Colors.grey), Text("Back", style: TextStyle(color: Colors.grey))])),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryGreen, 
              minimumSize: const Size(180, 50), 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              // Final Submit Logic - Mark registration as complete
              authController.completeRegistration();
              
              // Return to root, AuthWrapper will now show the Dashboard
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Row(children: [Text("Submit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), SizedBox(width: 8), Icon(Icons.chevron_right, color: Colors.white)]),
          ),
        ],
      ),
    );
  }
}