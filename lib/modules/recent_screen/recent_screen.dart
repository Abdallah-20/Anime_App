import 'package:anime_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Animes'),
      ),
      body: defaultGridView(context,false),
    );
  }
}
