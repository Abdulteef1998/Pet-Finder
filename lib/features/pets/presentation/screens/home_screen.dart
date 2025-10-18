import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder/features/pets/cubit/pet_cubit.dart';
import 'package:pet_finder/features/pets/cubit/pet_state.dart';
import 'package:pet_finder/features/pets/presentation/screens/pet_details_screen.dart';
import 'package:pet_finder/features/pets/presentation/widgets/pet_card.dart';
import 'package:svg_flutter/svg.dart';

import '../../data/repository/pet_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PetCubit(PetRepository())..loadPets(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Find Your Forever Pet",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: Colors.teal,
                      ),
                      onPressed: () {
                        // هنا يمكن فتح شاشة الإشعارات أو عمل أي وظيفة أخرى
                        print("Notifications tapped");
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: SvgPicture.asset(
                      'assets/search-normal.svg',
                      width: 20,
                      height: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(
                        'assets/setting-5.svg',
                        width: 20,
                        height: 20,
                      ),
                      onPressed: () {
                        print("Filters tapped");
                      },
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                Expanded(
                  child: BlocBuilder<PetCubit, PetState>(
                    builder: (context, state) {
                      if (state is PetLoaded) {
                        return ListView.builder(
                          itemCount: state.pets.length,
                          itemBuilder: (context, index) {
                            final pet = state.pets[index];
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PetDetailsPage(pet: pet),
                                ),
                              ),
                              child: PetCard(pet: pet),
                            );
                          },
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
