// lib/views/search_results_screen.dart
import 'package:flutter/material.dart';
import '../models/worker_models.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  static const Color primaryGreen = Color(0xFF006D44);
  bool isListView = true;

  final List<Worker> searchResults = [
    Worker(
      id: "1", name: "Kamal Ariyaratne", specialty: "Painter", location: "Colombo 5",
      rating: 4.9, reviewCount: 127, experience: 8, distance: 2.1,
      startingPrice: "5,000", priceUnit: "room", initial: "KA",
      isFeatured: true, isPro: true,
    ),
    Worker(
      id: "2", name: "Nuwan Mahesh", specialty: "Master Painter", location: "Colombo 3",
      rating: 4.8, reviewCount: 94, experience: 12, distance: 3.5,
      startingPrice: "4,500", priceUnit: "room", initial: "NM",
    ),
    Worker(
      id: "3", name: "Saman De Silva", specialty: "Wall Artist", location: "Dehiwala",
      rating: 4.7, reviewCount: 42, experience: 5, distance: 5.2,
      startingPrice: "6,200", priceUnit: "room", initial: "SD",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildSearchAppBar(),
      body: Column(
        children: [
          _buildFilters(),
          _buildListMapToggle(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text("Showing ${searchResults.length} of 24 workers", 
                  style: const TextStyle(color: Colors.grey, fontSize: 14)),
                const SizedBox(height: 16),
                ...searchResults.map((worker) => _buildWorkerCard(worker)),
                _buildLoadMore(),
                _buildFooter(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  PreferredSizeWidget _buildSearchAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: primaryGreen),
        onPressed: () => Navigator.pop(context),
      ),
      title: Container(
        height: 45,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F4F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: "Painters",
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.tune, color: primaryGreen),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildFilters() {
    final filters = ["All", "Near Me", "Top Rated", "Verified"];
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          bool isFirst = index == 0;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(filters[index]),
              selected: isFirst,
              onSelected: (val) {},
              backgroundColor: Colors.white,
              selectedColor: primaryGreen,
              labelStyle: TextStyle(color: isFirst ? Colors.white : Colors.black),
              shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade300)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildListMapToggle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF1F4F9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                _toggleButton("List", true),
                _toggleButton("Map", false),
              ],
            ),
          ),
          DropdownButton<String>(
            value: "Nearest",
            underline: const SizedBox(),
            items: ["Nearest", "Price", "Rating"].map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text("Sort by: $value"));
            }).toList(),
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }

  Widget _toggleButton(String text, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: active ? primaryGreen : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: TextStyle(color: active ? Colors.white : Colors.black)),
    );
  }

  Widget _buildWorkerCard(Worker worker) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/worker-profile-public'),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: primaryGreen,
                    child: Text(worker.initial, style: const TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(worker.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            _badge("Verified", Colors.green, Icons.check_circle),
                            if (worker.isFeatured) const SizedBox(width: 8),
                            if (worker.isFeatured) _badge("Featured", Colors.orange, Icons.star),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text("${worker.specialty} · ${worker.location} · ${worker.experience} yrs exp",
                          style: const TextStyle(color: Colors.grey, fontSize: 13)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 18),
                            const SizedBox(width: 4),
                            Text("${worker.rating} (${worker.reviewCount} reviews)", 
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                            const Spacer(),
                            Text("${worker.distance} km away", style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text("From LKR ${worker.startingPrice} / ${worker.priceUnit}",
                          style: const TextStyle(color: primaryGreen, fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(child: OutlinedButton(onPressed: () => Navigator.pushNamed(context, '/chat'), child: const Text("Chat first"))),
                            const SizedBox(width: 12),
                            Expanded(child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: primaryGreen),
                              onPressed: () => Navigator.pushNamed(context, '/booking-steps'), 
                              child: const Text("Book now", style: TextStyle(color: Colors.white)))),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (worker.isPro) ...[
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.circle, size: 8, color: Colors.amber.shade700),
                    const SizedBox(width: 8),
                    Text("PRO MEMBER", style: TextStyle(color: Colors.amber.shade900, fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
              )
            ]
          ],
        ),
      ),
    );
  }

  Widget _badge(String text, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(text, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildLoadMore() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 45)),
        onPressed: () {}, 
        child: const Text("Load more")
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const Text("No more workers nearby — expand search area?", 
          textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
        TextButton(
          onPressed: () {},
          child: const Text("Change distance radius", 
            style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryGreen,
      onTap: (index) {
        if (index == 0) Navigator.pushNamed(context, '/welcome'); // Home/Welcome
        if (index == 1) Navigator.pushNamed(context, '/my-bookings');
        if (index == 2) Navigator.pushNamed(context, '/chat-list');
        if (index == 3) Navigator.pushNamed(context, '/profile');
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Bookings"),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}