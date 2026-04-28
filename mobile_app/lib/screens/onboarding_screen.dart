import 'package:flutter/material.dart';

class OnboardingData {
  final String title;
  final String description;
  final String image;

  OnboardingData({required this.title, required this.description, required this.image});
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.grid_view_rounded, color: Color(0xFF006D44)),
        ),
        title: Text("SkilledLK", style: TextStyle(color: Color(0xFF006D44), fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {}, 
            child: Text("Skip", style: TextStyle(color: Colors.grey)),
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
                      SizedBox(height: 40),
                      Text(
                        onboardingContents[i].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
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
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                currentIndex == onboardingContents.length - 1 ? "Get Started" : "Continue",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (currentIndex == onboardingContents.length - 1) {
                   // Add navigation to Login here
                }
                _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF006D44),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Color(0xFF006D44) : Colors.grey[300],
      ),
    );
  }
}