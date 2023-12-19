import 'package:anime_app/shared/components/components.dart';
import 'package:anime_app/shared/cubit/cubit.dart';
import 'package:anime_app/shared/cubit/states.dart';
import 'package:anime_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAnimeScreen extends StatefulWidget {
  const MyAnimeScreen({super.key});

  @override
  State<MyAnimeScreen> createState() => _MyAnimeScreenState();
}

class _MyAnimeScreenState extends State<MyAnimeScreen> {
  bool button1Pressed = true;
  bool buttonViewPressed = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('My Anime'),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    buttonViewPressed = true;
                  });
                },
                icon: const Icon(Icons.view_agenda_rounded)),
            IconButton(
                onPressed: () {
                  setState(() {
                    buttonViewPressed = false;
                  });
                },
                icon: const Icon(Icons.grid_view_rounded)),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        button1Pressed = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: button1Pressed
                          ? defaultColor
                          : Colors.deepPurple.shade200,
                      foregroundColor:
                          button1Pressed ? Colors.white70 : defaultColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12)),
                      ),
                    ),
                    autofocus: true,
                    child: const Text('Watching'),
                  ),
                  const SizedBox(width: 1),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        button1Pressed = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !button1Pressed
                          ? defaultColor
                          : Colors.deepPurple.shade200,
                      foregroundColor:
                          !button1Pressed ? Colors.white70 : defaultColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                      ),
                    ),
                    child: const Text('Watched'),
                  ),
                ],
              ),
              if(buttonViewPressed)
                ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: vListViewItem(context),
                ),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8.0),
                  child: Container(height: 1,width: double.infinity,color: Colors.grey[300]),
                ),
                itemCount: 10,
              ),
              if(!buttonViewPressed)
                defaultGridView(context, false),
            ],
          ),
        ),
      ),
    );
  }
}
