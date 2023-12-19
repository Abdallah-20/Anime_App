import 'package:anime_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Animes'),
      ),
      body: defaultGridView(context,false),
    );
  }
}
