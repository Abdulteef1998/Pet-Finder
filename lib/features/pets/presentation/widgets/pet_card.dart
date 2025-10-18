import 'package:flutter/material.dart';
import 'package:pet_finder/core/utils/app_colors.dart';
import 'package:pet_finder/features/pets/data/models/pet_model.dart';

class PetCard extends StatelessWidget {
  final PetModel pet;
  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(pet.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          pet.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${pet.gender} - ${pet.age}"),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red, size: 16),
                Text("${pet.distance} km away"),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.favorite_border),
      ),
    );
  }
}
