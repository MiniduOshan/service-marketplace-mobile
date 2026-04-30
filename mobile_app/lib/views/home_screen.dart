import 'package:flutter/material.dart';

import '../models/worker_models.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock Data (Representing unloaded state)
  final String customerName = "[Name]";
  final String currentLocation = "[Fetching Location...]";

  // Category Data using generic icons
  final List<Category> categories = [
    Category(name: "Painting", iconData: Icons.brush_outlined),
    Category(name: "Electrical", iconData: Icons.power_outlined),
    Category(name: "Plumbing", iconData: Icons.water_drop_outlined),
    Category(name: "Carpentry", iconData: Icons.handyman_outlined),
    Category(name: "AC Repair", iconData: Icons.ac_unit_outlined),
    Category(name: "Cleaning", iconData: Icons.cleaning_services_outlined),
    Category(name: "Masonry", iconData: Icons.foundation_outlined),
    Category(name: "More", iconData: Icons.add_outlined),
  ];

  // Worker Mock Data (using placeholders)
  final List<Worker> topRatedWorkers = [
    Worker(id: "1", name: "Aruna Kumara", specialty: "Electrician", rating: 4.9, experience: 8, distance: 2.1, startingPrice: "5,000", priceUnit: "day", initial: "AK"),
    Worker(id: "2", name: "Sunil Perera", specialty: "Plumber", rating: 4.8, experience: 6, distance: 1.8, startingPrice: "4,500", priceUnit: "day", initial: "SP"),
    Worker(id: "3", name: "Samantha Silva", specialty: "Carpenter", rating: 4.7, experience: 10, distance: 3.5, startingPrice: "6,000", priceUnit: "day", initial: "SS"),
  ];

  final List<Worker> featuredWorkers = [
    Worker(id: "4", name: "Nimal Bandara", specialty: "Master Painter", rating: 4.9, experience: 12, distance: 0.8, startingPrice: "3,500", priceUnit: "day", initial: "NB"),
    Worker(id: "5", name: "Kasun Rajapaksha", specialty: "AC Technician", rating: 4.7, experience: 5, distance: 1.5, startingPrice: "2,500", priceUnit: "service", initial: "KR"),
  ];

  // Defining the main green color
  static const Color primaryGreen = Color(0xFF006D44);
  static const Color placeholderBackgroundColor = Color(0xFFF1F4F9);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildHeader(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLocationSelector(),
              _buildSearchBar(),
              _buildCategorySection(),
              const SizedBox(height: 16),
              _buildWorkerCarousel("Top Rated Near You", topRatedWorkers, _buildTopRatedCard),
              const SizedBox(height: 24),
              _buildFeaturedSection(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }


  // --- UI COMPONENT METHODS (MODIFIED FOR PLACEHOLDERS) ---

  // 1. Header (AppBar) with generic avatar
  PreferredSizeWidget _buildHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: placeholderBackgroundColor,
            child: const Icon(Icons.person, color: Colors.grey), // Standard profile placeholder
          ),
          const SizedBox(width: 12),
          Text(
            "Good morning, $customerName 👋",
            style: const TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none_outlined, color: Colors.grey, size: 28),
              onPressed: () {},
            ),
            Positioned(
              right: 12,
              top: 14,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  // 2. Location Selector (Placeholders for icons/text)
  Widget _buildLocationSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFE9F1EE),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: primaryGreen, size: 20),

            const SizedBox(width: 8),
            Expanded(
              child: Text(
                currentLocation,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                "Change",
                style: TextStyle(color: primaryGreen, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 3. Search Bar
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search painters, electricians...",
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          filled: true,
          fillColor: const Color(0xFFF1F4F9),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: const Icon(Icons.tune, color: Color(0xFF1B434D), size: 20),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(28), borderSide: BorderSide.none),
        ),
      ),
    );
  }

  // 4. Categories Section (Modified to use IconData placeholders)
  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Categories"),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F8F9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Icon(category.iconData, color: const Color(0xFF1B434D), size: 30),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  // Generic Worker Section Builder
  Widget _buildWorkerCarousel(String title, List<Worker> workers, Widget Function(Worker) cardBuilder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(title),
        SizedBox(
          height: 230, // Increased height for stability
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            scrollDirection: Axis.horizontal,
            itemCount: workers.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return cardBuilder(workers[index]);
            },
          ),
        ),
      ],
    );
  }

  // 5. Top Rated Card (Horizontal List) with Circular Initials placeholder
  Widget _buildTopRatedCard(Worker worker) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE9F1EE)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(color: Color(0xFFE8F6F1), shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text(worker.initial, style: TextStyle(color: primaryGreen, fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const Spacer(),
              _buildVerifiedBadge(),
            ],
          ),
          const SizedBox(height: 12),
          Text(worker.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(worker.specialty, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(worker.rating.toString(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const Spacer(),
              Text("${worker.distance} km", style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          const Text("From", style: TextStyle(fontSize: 12, color: Colors.grey)),
          Text("LKR ${worker.startingPrice}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryGreen)),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              ),
              child: const Text("Book", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  // 6. Featured Section (Vertical List)
  Widget _buildFeaturedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Featured Workers"),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          itemCount: featuredWorkers.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return _buildFeaturedWorkerTile(featuredWorkers[index]);
          },
        ),
      ],
    );
  }

  // 7. Featured Worker Tile with Default Icon placeholder
  Widget _buildFeaturedWorkerTile(Worker worker) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE9F1EE)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: placeholderBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              // image: DecorationImage(image: AssetImage(worker.imageUrl), fit: BoxFit.cover), // Replaced by icon below
            ),
            child: const Icon(Icons.engineering_outlined, color: Colors.grey, size: 35), // Default icon placeholder
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(worker.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    const SizedBox(width: 6),
                    _buildVerifiedBadgeShort(),
                  ],
                ),
                Text("${worker.specialty} • ${worker.experience} yrs exp.", style: const TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 4),
                const Text("Starting at", style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text("LKR ${worker.startingPrice}/${worker.priceUnit}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryGreen)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(worker.rating.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 4),
              Text("${worker.distance} km away", style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 12),
              SizedBox(
                height: 36,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: primaryGreen),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                  child: Text("View", style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- HELPER METHODS ---

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextButton(
            onPressed: () {},
            child: Text("See all", style: TextStyle(color: primaryGreen, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifiedBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: const Color(0xFFE8F6F1), borderRadius: BorderRadius.circular(12)),
      child: Text("Verified", style: TextStyle(color: primaryGreen, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildVerifiedBadgeShort() {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFF0D6827), shape: BoxShape.circle),
      padding: const EdgeInsets.all(2),
      child: const Icon(Icons.check, color: Colors.white, size: 10),
    );
  }

  // 8. Bottom Navigation Bar
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE9F1EE), width: 1)),
      ),
      child: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: primaryGreen,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}