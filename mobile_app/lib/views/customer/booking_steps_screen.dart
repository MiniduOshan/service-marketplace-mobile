import 'package:flutter/material.dart';

class BookingStepsScreen extends StatefulWidget {
  const BookingStepsScreen({super.key});

  @override
  State<BookingStepsScreen> createState() => _BookingStepsScreenState();
}

class _BookingStepsScreenState extends State<BookingStepsScreen> {
  int currentStep = 2; // Starting at Step 2 based on your "Book Service" image
  static const Color primaryGreen = Color(0xFF006D44);

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
        centerTitle: true,
        title: Column(
          children: [
            Text(_getStepTitle(), style: const TextStyle(color: primaryGreen, fontWeight: FontWeight.bold, fontSize: 18)),
            Text("STEP $currentStep OF 4", style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildStepIndicator(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: _buildCurrentStepView(),
            ),
          ),
          _buildBottomActions(),
        ],
      ),
    );
  }

  String _getStepTitle() {
    switch (currentStep) {
      case 2: return "Book Service";
      case 3: return "Review Booking";
      case 4: return "Payment";
      default: return "Booking";
    }
  }

  Widget _buildStepIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _stepCircle(1, "Worker", isDone: true),
          _stepLine(true),
          _stepCircle(2, "Details", isActive: currentStep == 2, isDone: currentStep > 2),
          _stepLine(currentStep > 2),
          _stepCircle(3, "Confirm", isActive: currentStep == 3, isDone: currentStep > 3),
          _stepLine(currentStep > 3),
          _stepCircle(4, "Pay", isActive: currentStep == 4),
        ],
      ),
    );
  }

  Widget _stepCircle(int step, String label, {bool isActive = false, bool isDone = false}) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDone ? primaryGreen : Colors.white,
            border: Border.all(color: (isActive || isDone) ? primaryGreen : Colors.grey.shade300, width: 2),
          ),
          child: Center(
            child: isDone 
              ? const Icon(Icons.check, color: Colors.white, size: 16) 
              : Text("$step", style: TextStyle(color: isActive ? primaryGreen : Colors.grey, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 10, color: (isActive || isDone) ? primaryGreen : Colors.grey, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _stepLine(bool isDone) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        height: 2,
        color: isDone ? primaryGreen : Colors.grey.shade300,
      ),
    );
  }

  Widget _buildCurrentStepView() {
    if (currentStep == 2) return _buildDetailsStep();
    if (currentStep == 3) return _buildReviewStep();
    return _buildPaymentStep();
  }

  // Implementation of Step 2: Book Service (Details)
  Widget _buildDetailsStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWorkerMiniCard(),
        const SizedBox(height: 24),
        const Text("PREFERRED DATE", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 8),
        _buildInputDecoration(hint: "28 April 2025", icon: Icons.calendar_today_outlined),
        const SizedBox(height: 20),
        const Text("FULL ADDRESS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 8),
        _buildInputDecoration(hint: "123 Temple Road, Maharagama", icon: Icons.location_on_outlined),
        const SizedBox(height: 20),
        const Text("JOB DESCRIPTION", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 8),
        TextField(maxLines: 4, decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
      ],
    );
  }

  // Implementation of Step 3: Review Booking
  Widget _buildReviewStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Check your booking details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        _buildReviewCard(Icons.calendar_month, "Schedule", "28 April 2025\n9:00 AM - 12:00 PM"),
        _buildReviewCard(Icons.location_on, "Location", "123 Temple Road, Maharagama"),
        _buildPriceSummary(),
      ],
    );
  }

  // Implementation of Step 4: Payment
  Widget _buildPaymentStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPriceSummaryBox(),
        const SizedBox(height: 24),
        const Text("Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _paymentOption("Credit / Debit Card", Icons.credit_card, true),
        _paymentOption("Mobile Wallet", Icons.wallet, false),
        _paymentOption("Cash to worker", Icons.payments, false),
      ],
    );
  }

  Widget _buildWorkerMiniCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200), borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.grey.shade200, child: const Icon(Icons.person)),
        title: const Text("Kasun Silva", style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text("Room painting • LKR 5,000", style: TextStyle(color: primaryGreen)),
        trailing: const Text("Change", style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildInputDecoration({required String hint, required IconData icon}) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildReviewCard(IconData icon, String title, String content) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200), borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: primaryGreen),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 4),
              Text(content, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPriceSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFE9F1EE), borderRadius: BorderRadius.circular(12)),
      child: const Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Service fee"), Text("LKR 5,000")]),
          SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Platform fee"), Text("LKR 250")]),
          Divider(height: 32),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Total Amount", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("LKR 5,250", style: TextStyle(fontWeight: FontWeight.bold, color: primaryGreen, fontSize: 18)),
          ]),
        ],
      ),
    );
  }

  Widget _buildPriceSummaryBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFE9F1EE), borderRadius: BorderRadius.circular(12)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total Amount", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("LKR 5,250", style: TextStyle(fontWeight: FontWeight.bold, color: primaryGreen, fontSize: 18)),
        ],
      ),
    );
  }

  Widget _paymentOption(String title, IconData icon, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? primaryGreen : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? primaryGreen : Colors.grey),
        title: Text(title, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
        trailing: Radio(value: true, groupValue: isSelected, onChanged: (v) {}, fillColor: WidgetStateProperty.all(primaryGreen)),
      ),
    );
  }

  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFFF1F4F9)))),
      child: Row(
        children: [
          TextButton(onPressed: () { if(currentStep > 2) setState(() => currentStep--); }, child: const Text("Back", style: TextStyle(color: Colors.grey))),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryGreen, minimumSize: const Size(200, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            onPressed: () {
              if (currentStep < 4) {
                setState(() => currentStep++);
              } else {
                Navigator.pop(context); // Booking finished
              }
            },
            child: Text(currentStep == 4 ? "Confirm & Pay" : "Continue", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}