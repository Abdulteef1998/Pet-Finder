import 'package:flutter/material.dart';

import '../../data/models/pet_model.dart';
import '../widgets/pet_card.dart';

class FavoritePetsPage extends StatelessWidget {
  const FavoritePetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PetModel> pets = [
      PetModel(
        name: 'Joli',
        image: 'assets/cat.jpg',
        distance: 1.6,
        gender: 'male',
        age: '22',
      ),
      PetModel(
        name: 'Oliver',
        image: 'assets/birds.jpg',
        distance: 2.0,
        gender: 'male',
        age: '22',
      ),
      PetModel(
        name: 'Tom',
        image: 'assets/dog.jpg',
        distance: 2.7,
        gender: 'male',
        age: '22',
      ),
    ];

    final List<String> categories = [
      "All",
      "Cats",
      "Dogs",
      "Birds",
      "Fish",
      "Reptiles",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Favorite Pets",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryFilter(
            categories: categories,
            onCategorySelected: (index) {
              // يمكن إضافة فلترة الحيوانات حسب الفئة هنا لاحقًا
              print('Selected category: ${categories[index]}');
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemCount: pets.length,
              itemBuilder: (context, index) {
                return PetCard(pet: pets[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryFilter extends StatefulWidget {
  final List<String> categories;
  final ValueChanged<int>? onCategorySelected;

  const CategoryFilter({
    super.key,
    required this.categories,
    this.onCategorySelected,
  });

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  late List<bool> selected;

  @override
  void initState() {
    super.initState();
    selected = List<bool>.generate(
      widget.categories.length,
      (index) => index == 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (_, __) => const SizedBox(width: 10), // gap: 10px
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          return FilterChip(
            label: Text(
              widget.categories[index],
              style: TextStyle(
                color: selected[index] ? Colors.white : Colors.teal,
                fontSize: 14,
              ),
            ),
            selected: selected[index],
            onSelected: (_) {
              setState(() {
                for (int i = 0; i < selected.length; i++) {
                  selected[i] = i == index;
                }
              });
              if (widget.onCategorySelected != null) {
                widget.onCategorySelected!(index);
              }
            },
            backgroundColor: Colors.teal.withOpacity(0.1),
            selectedColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100), // border-radius: 100px
            ),
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6), // padding
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          );
        },
      ),
    );
  }
}
