import 'package:anime_app/shared/cubit/cubit.dart';
import 'package:anime_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeLayout extends StatelessWidget {
  const AnimeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: AppCubit.get(context)
            .bottomNavBarScreens[AppCubit.get(context).navBarCurrentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: AppCubit.get(context).navBarCurrentIndex,
          onTap: (index) {
            AppCubit.get(context).changeNavBarIndex(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_collection_outlined), label: 'My Anime'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
