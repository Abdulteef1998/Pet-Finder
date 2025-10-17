import 'package:flutter/material.dart';
import 'package:pet_finder/features/pets/presentation/widgets/search_bar.dart';

void main() {
  runApp(const PetFinderApp());
}

class PetFinderApp extends StatelessWidget {
  const PetFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PetFinder App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const PetApp(),
    );
  }
}
