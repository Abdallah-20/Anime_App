import 'package:anime_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Animes'),
      ),
      body: defaultGridView(context,false),
    );
  }
}
