import 'package:flutter/material.dart';
import 'package:pet_finder/features/pets/presentation/screens/on_boarding_screen.dart';
import 'package:svg_flutter/svg_flutter.dart';

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
          width: 203,
          height: 181,

          child: Center(
            child: SvgPicture.asset(
              'assets/heart.svg',
              width: 203,
              height: 181,
            ),
          ),
        ),
      ),
    );
  }
}
