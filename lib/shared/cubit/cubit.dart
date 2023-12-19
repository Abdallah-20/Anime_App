import 'package:anime_app/modules/home_screen/home_screen.dart';
import 'package:anime_app/modules/my_anime_screen/my_anime_screen.dart';
import 'package:anime_app/modules/profile_screen/profile_screen.dart';
import 'package:anime_app/modules/search_screen/search_screen.dart';
import 'package:anime_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppCubitStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> bottomNavBarScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const MyAnimeScreen(),
    const ProfileScreen(),
  ];
  int navBarCurrentIndex = 0;

  void changeNavBarIndex(int index){
    navBarCurrentIndex = index;
    emit(ChangeNavBarIndexState());
  }

  void changeMyAnimeButton(){
    emit(ChangeMyAnimeButtonState());
  }

  void filterButton(){
    emit(FilterButtonPressedState());
  }

  List<bool> genre = List.generate(20, (index) => false);
  void genreSelected(int index){
    genre[index] = !genre[index];
    emit(GenreSelectedState());
  }
}