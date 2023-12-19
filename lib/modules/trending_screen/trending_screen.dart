import 'package:anime_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Animes'),
      ),
      body: defaultGridView(context,false),
    );
  }
}
