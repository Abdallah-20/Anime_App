import 'package:anime_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontSize: 25.0,
      color: Colors.black,
      fontFamily: 'Jannah',
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //   backgroundColor: Colors.deepOrange,
  // ),


  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1.3,
    ),
  ),
  fontFamily: 'Jannah',
);

ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.black,
  // appBarTheme: AppBarTheme(
  //   titleSpacing: 20.0,
  //   systemOverlayStyle: SystemUiOverlayStyle(
  //     statusBarColor: HexColor('333739'),
  //     statusBarIconBrightness: Brightness.light,
  //   ),
  //   backgroundColor: HexColor('333739'),
  //   elevation: 0.0,
  //   titleTextStyle: TextStyle(
  //     fontSize: 20.0,
  //     color: Colors.white,
  //     fontWeight: FontWeight.bold,
  //     fontFamily: 'Jannah',
  //   ),
  //   iconTheme: IconThemeData(
  //     color: Colors.white,
  //   ),
  // ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
  ),
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //   backgroundColor: Colors.deepOrange,
  // ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.3,
    ),
  ),
  fontFamily: 'Jannah',
);
