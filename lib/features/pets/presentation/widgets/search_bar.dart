import 'package:flutter/material.dart';

class PetApp extends StatelessWidget {
  const PetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Companion',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 120,
          width: 120,
          decoration: const BoxDecoration(
            color: Color(0xFF3DC7B7), // نفس اللون الأخضر في الصورة
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.favorite, // مؤقت حتى تضيف صورة الطائر
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // صورة الحيوانات
              Image.asset(
                'assets/images/pets.png', // ضع الصورة هنا في مجلد assets
                height: 300,
                fit: BoxFit.contain,
              ),

              // النصوص
              Column(
                children: const [
                  Text(
                    'Find Your Best\nCompanion With Us',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Join & discover the best suitable pets as\nper your preferences in your location',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),

              // زر البدء
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.pets, color: Colors.white),
                  label: const Text('Get started'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3DC7B7),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                    elevation: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
