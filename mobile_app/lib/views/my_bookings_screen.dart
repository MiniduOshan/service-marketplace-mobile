import 'package:flutter/material.dart';
import 'cancel_booking_screen.dart'; // Import the cancellation screen

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  static const Color primaryGreen = Color(0xFF006D44);
  static const Color backgroundGrey = Color(0xFFF6F8F9);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 1, // Start on the "Active" tab as per Figma
      child: Scaffold(
        backgroundColor: backgroundGrey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: primaryGreen),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            "My Bookings",
            style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.grey),
              onPressed: () {},
            )
          ],
          bottom: const TabBar(
            isScrollable: true,
            labelColor: primaryGreen,
            unselectedLabelColor: Colors.grey,
            indicatorColor: primaryGreen,
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            tabs: [
              Tab(text: "All"),
              Tab(text: "Active"),
              Tab(text: "Pending"),
              Tab(text: "Completed"),
              Tab(text: "Cancelled"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildAllTab(),
            _buildActiveTab(context),
            _buildPendingTab(context),
            _buildCompletedTab(),
            _buildCancelledTab(),
          ],
        ),
      ),
    );
  }

  // --- TAB CONTENT BUILDERS ---

  Widget _buildAllTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text("Showing all recent bookings", style: TextStyle(color: Colors.grey)),
        SizedBox(height: 16),
        // Add a mix of cards here
      ],
    );
  }

  Widget _buildActiveTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildActiveBookingCard(context),
      ],
    );
  }

  Widget _buildPendingTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildPendingBookingCard(context),
      ],
    );
  }

  Widget _buildCompletedTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSimpleStatusCard(
          status: "Completed",
          statusColor: Colors.green,
          title: "Deep Cleaning Service",
          subtitle: "Completed on 15 April 2025",
          showStars: true,
          actionLabel: "Rebook",
        ),
      ],
    );
  }

  Widget _buildCancelledTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSimpleStatusCard(
          status: "Cancelled",
          statusColor: Colors.red,
          title: "Plumbing Leak Fix",
          subtitle: "Cancelled by worker",
          orderId: "#BK-0988",
          showRefundInfo: true,
          actionLabel: "Details",
        ),
      ],
    );
  }

  // --- REUSABLE CARD COMPONENTS ---

  // 1. The Complex Active Card with Progress Stepper
  Widget _buildActiveBookingCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("#BK-1041", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://placeholder.com/100'), // Replace with image_11.png
              ),
            ],
          ),
          _statusBadge("Active", Colors.green),
          const SizedBox(height: 12),
          const Text("Kasun Silva (Painter)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.brush_outlined, size: 18, color: Colors.grey),
              SizedBox(width: 8),
              Text("Room painting · 28 April 2025, 9:00 AM", style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.location_on_outlined, size: 18, color: Colors.grey),
              SizedBox(width: 8),
              Text("123 Temple Rd, Maharagama", style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("LKR 5,000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Text("Advance paid: LKR 2,500", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 24),
          _buildProgressStepper(),
          const SizedBox(height: 24),
          Row(
            children: [
              _actionButton(Icons.call, "Call", () {}),
              const SizedBox(width: 8),
              _actionButton(Icons.chat_bubble_outline, "Chat", () {}),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send, color: Colors.white, size: 18),
                  label: const Text("Track", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    minimumSize: const Size(0, 48),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // 2. The Stepper Widget
  Widget _buildProgressStepper() {
    return Row(
      children: [
        _stepCircle(true, "Confirmed"),
        _stepLine(true),
        _stepCircle(true, "Assigned"),
        _stepLine(true),
        _stepCircle(true, "In Progress", isCurrent: true),
        _stepLine(false),
        _stepCircle(false, "Done"),
      ],
    );
  }

  Widget _stepCircle(bool isDone, String label, {bool isCurrent = false}) {
    return Column(
      children: [
        Container(
          width: 14, height: 14,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDone ? primaryGreen : Colors.grey.shade300,
            border: isCurrent ? Border.all(color: primaryGreen.withValues(alpha: 0.3), width: 6) : null,
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 10, color: isDone ? primaryGreen : Colors.grey, fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }

  Widget _stepLine(bool isDone) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 18),
        color: isDone ? primaryGreen : Colors.grey.shade300,
      ),
    );
  }

  // 3. The Pending Card
  Widget _buildPendingBookingCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("#BK-1042", style: TextStyle(color: Colors.grey)),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle),
                child: const Icon(Icons.person_outline, color: Colors.grey, size: 20),
              ),
            ],
          ),
          _statusBadge("Pending acceptance", Colors.orange),
          const SizedBox(height: 12),
          const Text("Searching for Worker...", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const Text("Electrical repair · Today, 2:00 PM", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.info_outline, color: Colors.orange, size: 16),
              const SizedBox(width: 4),
              const Text("Worker will respond within 1 hour", style: TextStyle(color: Colors.orange, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CancelBookingScreen())),
                child: const Text("Cancel booking", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                child: const Text("Details", style: TextStyle(color: primaryGreen)),
              ),
            ],
          )
        ],
      ),
    );
  }

  // 4. Simple Status Card (Completed/Cancelled)
  Widget _buildSimpleStatusCard({
    required String status,
    required Color statusColor,
    required String title,
    required String subtitle,
    String? orderId,
    bool showStars = false,
    bool showRefundInfo = false,
    required String actionLabel,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statusBadge(status, statusColor),
              if (orderId != null) Text(orderId, style: const TextStyle(color: Colors.grey)),
              if (showStars) const Text("⭐⭐⭐⭐⭐", style: TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
          if (showRefundInfo) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xFFE8F6F1), borderRadius: BorderRadius.circular(8)),
              child: const Row(
                children: [
                  Icon(Icons.check_circle_outline, color: Colors.green, size: 18),
                  SizedBox(width: 8),
                  Text("Refund: LKR 1,250 processed", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              child: Text(actionLabel, style: const TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  // --- HELPERS ---

  Widget _statusBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
      child: Text(text, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }

  Widget _actionButton(IconData icon, String label, VoidCallback onTap) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 18, color: Colors.black),
        label: Text(label, style: const TextStyle(color: Colors.black)),
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}