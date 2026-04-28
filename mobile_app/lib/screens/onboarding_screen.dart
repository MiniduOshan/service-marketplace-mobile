import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Import the next screen

class OnboardingData {
  final String title;
  final String description;
  final String image;

  OnboardingData({required this.title, required this.description, required this.image});
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  final List<OnboardingData> onboardingContents = [
    OnboardingData(
      title: "Find skilled workers near you",
      description: "Painters, electricians, plumbers and more — verified professionals across Sri Lanka",
      image: "assets/images/onboarding1.png",
    ),
    OnboardingData(
      title: "Every worker is verified",
      description: "ID checked, rated by real customers, and monitored for quality.",
      image: "assets/images/onboarding2.png",
    ),
    OnboardingData(
      title: "Book in minutes",
      description: "Choose a package, pick your date, and pay securely — all in one place.",
      image: "assets/images/onboarding3.png",
    ),
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.grid_view_rounded, color: Color(0xFF006D44)),
        ),
        title: const Text("SkilledLK", style: TextStyle(color: Color(0xFF006D44), fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
            }, 
            child: const Text("Skip", style: TextStyle(color: Colors.grey)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingContents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Image.asset(onboardingContents[i].image, height: 250),
                      const SizedBox(height: 40),
                      Text(
                        onboardingContents[i].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        onboardingContents[i].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingContents.length,
              (index) => buildDot(index),
            ),
          ),
          Container(
            height: 55,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006D44),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                if (currentIndex == onboardingContents.length - 1) {
                  // NAVIGATION LOGIC
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context) => const WelcomeScreen())
                  );
                } else {
                  _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                }
              },
              child: Text(
                currentIndex == onboardingContents.length - 1 ? "Get Started" : "Continue",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 8,
      width: currentIndex == index ? 20 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? const Color(0xFF006D44) : Colors.grey[300],
      ),
    );
  }
}