import 'package:anime_app/shared/cubit/cubit.dart';
import 'package:anime_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Genre'), centerTitle: true),
          body: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 1.66/1,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            children: List.generate(
                20,
                (index) => genreItem(index: index, context: context)),
          ),
        );
      },
    );
  }

  Widget genreItem({required int index, context}) => Container(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          onTap: () {
            AppCubit.get(context).genreSelected(index);
          },
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/on_board_1.jpg'),
                fit: BoxFit.cover,
              ),
              Row(
                children: [
                  Checkbox(
                    value: AppCubit.get(context).genre[index],
                    onChanged: (bool? newValue) {
                      AppCubit.get(context).genreSelected(index);
                    },
                    shape: const CircleBorder(),
                  ),
                  const Text('Drama',style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      );
}
