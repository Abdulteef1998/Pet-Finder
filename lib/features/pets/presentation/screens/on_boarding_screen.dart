import 'package:flutter/material.dart';
import 'package:pet_finder/features/pets/presentation/layout/screen/layout_page.dart';
import 'package:pet_finder/features/pets/presentation/widgets/custom_button.dart';

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
              // 🐶 صورة الحيوانات
              SizedBox(
                width: 442,
                height: 305,
                child: Image.asset('assets/animls.png', fit: BoxFit.contain),
              ),

              // 🧾 النصوص
              Column(
                children: const [
                  Text(
                    'Find Your Best\nCompanion With Us',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Join & discover the best suitable pets as\nper your preferences in your location',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),

              // 🐾 زر البدء
              CustomButton(
                color: const Color(0xff44BDB6),
                label: 'Get started',
                icon: Icons.pets,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LayoutPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
