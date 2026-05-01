import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  static const Color primaryGreen = Color(0xFF006D44);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Chats", 
          style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.search, color: primaryGreen), onPressed: () {}),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRecentWorkers(),
          Expanded(child: _buildChatList(context)),
        ],
      ),
    );
  }

  Widget _buildRecentWorkers() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Recent Workers", 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: 5,
              itemBuilder: (context, index) {
                return _recentWorkerAvatar("Kasun"); // Placeholder names
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _recentWorkerAvatar(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(radius: 30, backgroundColor: Color(0xFFE2E8F0)),
              Positioned(
                right: 2, bottom: 2,
                child: Container(
                  width: 12, height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green, 
                    shape: BoxShape.circle, 
                    border: Border.all(color: Colors.white, width: 2)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildChatList(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 10),
      itemCount: 4,
      separatorBuilder: (context, index) => const Divider(height: 1, indent: 90),
      itemBuilder: (context, index) {
        return _chatTile(
          context,
          "Kasun Silva",
          "PAINTER",
          "Great! I'll be there at 9 AM...",
          "10:27 AM",
          unreadCount: index == 0 ? 2 : 0,
        );
      },
    );
  }

  Widget _chatTile(BuildContext context, String name, String tag, String msg, String time, {int unreadCount = 0}) {
    return ListTile(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatScreen())),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      tileColor: Colors.white,
      leading: const CircleAvatar(radius: 28, backgroundColor: Color(0xFFE2E8F0)),
      title: Row(
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 10),
          _tag(tag),
        ],
      ),
      subtitle: Text(msg, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 5),
          if (unreadCount > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(color: primaryGreen, shape: BoxShape.circle),
              child: Text("$unreadCount", style: const TextStyle(color: Colors.white, fontSize: 10)),
            ),
        ],
      ),
    );
  }

  Widget _tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: const Color(0xFFEFF6FF), borderRadius: BorderRadius.circular(4)),
      child: Text(text, style: const TextStyle(color: Color(0xFF3B82F6), fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }
}