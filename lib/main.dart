import 'package:anime_app/modules/anime_details_screen/anime_details_screen.dart';
import 'package:anime_app/modules/on_boarding_screen.dart';
import 'package:anime_app/modules/test.dart';
import 'package:anime_app/shared/bloc_observer.dart';
import 'package:anime_app/shared/cubit/cubit.dart';
import 'package:anime_app/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  MediaKit.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home:
        const OnBoardingScreen(),
        // TestScreen(),
        // const AnimeDetailsScreen(),

      ),
    );
  }
}
