import 'package:flutter/material.dart';
import 'document_verification_screen.dart';

class WorkerRegistrationScreen extends StatefulWidget {
  const WorkerRegistrationScreen({super.key});

  @override
  State<WorkerRegistrationScreen> createState() => _WorkerRegistrationScreenState();
}

class _WorkerRegistrationScreenState extends State<WorkerRegistrationScreen> {
  static const Color primaryGreen = Color(0xFF006D44);
  int experienceYears = 8;
  bool isGpsActive = true;

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
        title: const Text("Worker Registration", 
          style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildProgressBar(0.5, "Step 2 of 4 — Personal Details", "50% Complete"),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Tell us about yourself", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const Text("This information will appear on your public profile.", style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 30),
                  _buildPhotoUpload(),
                  const SizedBox(height: 30),
                  _buildLabel("FULL NAME"),
                  _buildTextField("Kasun Silva"),
                  const SizedBox(height: 20),
                  _buildLabel("PHONE NUMBER"),
                  _buildPhoneField(),
                  const SizedBox(height: 20),
                  _buildLabel("SERVICE CATEGORY"),
                  _buildDropdown("Painter"),
                  const SizedBox(height: 20),
                  _buildLabel("YEARS OF EXPERIENCE"),
                  _buildExperiencePicker(),
                  const SizedBox(height: 20),
                  _buildLabel("BIO"),
                  _buildTextField("Briefly describe your expertise...", maxLines: 4),
                  const SizedBox(height: 20),
                  _buildLabel("SKILLS"),
                  _buildSkillChips(),
                  const SizedBox(height: 20),
                  _buildLabel("DAILY RATE (LKR)"),
                  _buildTextField("4500", prefix: "Rs. "),
                  const SizedBox(height: 30),
                  _buildLocationSection(),
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

  Widget _buildPhotoUpload() {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: primaryGreen, style: BorderStyle.solid, width: 1.5),
            ),
            child: const Icon(Icons.camera_alt_outlined, color: primaryGreen, size: 30),
          ),
          const SizedBox(height: 8),
          const Text("Upload photo", style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1D2125))),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1, String? prefix}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        prefixText: prefix,
        filled: true,
        fillColor: const Color(0xFFF6F8F9),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Row(
      children: [
        Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(color: const Color(0xFFF6F8F9), borderRadius: BorderRadius.circular(12)),
          alignment: Alignment.center,
          child: const Text("+94"),
        ),
        const SizedBox(width: 12),
        Expanded(child: _buildTextField("77 123 4567")),
      ],
    );
  }

  Widget _buildDropdown(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(color: const Color(0xFFF6F8F9), borderRadius: BorderRadius.circular(12)),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        items: [value].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (v) {},
      ),
    );
  }

  Widget _buildExperiencePicker() {
    return Row(
      children: [
        _counterButton(Icons.remove, () => setState(() => experienceYears--)),
        Expanded(child: Center(child: Text("$experienceYears", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))),
        _counterButton(Icons.add, () => setState(() => experienceYears++)),
      ],
    );
  }

  Widget _counterButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: const Color(0xFFF6F8F9), borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, color: primaryGreen),
      ),
    );
  }

  Widget _buildSkillChips() {
    return Wrap(
      spacing: 8,
      children: [
        _skillChip("Interior Painting"),
        _skillChip("Exterior"),
        _skillChip("Waterproofing"),
        const CircleAvatar(radius: 20, backgroundColor: primaryGreen, child: Icon(Icons.add, color: Colors.white)),
      ],
    );
  }

  Widget _skillChip(String label) {
    return Chip(
      label: Text(label, style: const TextStyle(color: primaryGreen, fontSize: 12)),
      backgroundColor: const Color(0xFFE8F6F1),
      onDeleted: () {},
      deleteIcon: const Icon(Icons.close, size: 14, color: primaryGreen),
      side: BorderSide.none,
      shape: StadiumBorder(),
    );
  }

  Widget _buildLocationSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Service Location", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(children: [
              Switch(value: isGpsActive, onChanged: (v) => setState(() => isGpsActive = v), activeThumbColor: primaryGreen),
              const Text("GPS Active", style: TextStyle(fontSize: 12, color: Colors.green)),
            ]),
          ],
        ),
        _buildTextField("Colombo", prefix: "📍 "),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: ["Colombo 01-15", "Nugegoda", "Dehiwala", "Battaramulla"]
              .map((e) => ChoiceChip(label: Text(e), selected: e == "Colombo 01-15", onSelected: (v) {}, selectedColor: const Color(0xFFE8F6F1)))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFFF1F4F9)))),
      child: Row(
        children: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Back", style: TextStyle(color: Colors.grey))),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryGreen, minimumSize: const Size(180, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DocumentVerificationScreen())),
            child: const Row(children: [Text("Next: Documents", style: TextStyle(color: Colors.white)), Icon(Icons.chevron_right, color: Colors.white)]),
          ),
        ],
      ),
    );
  }
}