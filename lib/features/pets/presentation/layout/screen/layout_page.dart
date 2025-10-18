import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder/core/utils/app_colors.dart';
import 'package:pet_finder/features/pets/presentation/layout/screen/favorites_page.dart';
import 'package:pet_finder/features/pets/presentation/layout/screen/messages_page.dart';
import 'package:pet_finder/features/pets/presentation/layout/screen/profile_page.dart';
import 'package:pet_finder/features/pets/presentation/screens/home_screen.dart';

import '../cubit/layout_cubit.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = const [
      HomeScreen(),
      FavoritePe(),
      MessagesPage(),
      ProfilePage(),
    ];

    return BlocProvider(
      create: (_) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: pages[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => context.read<LayoutCubit>().changeTab(index),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: "Favorites",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  label: "Messages",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: "Profile",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
