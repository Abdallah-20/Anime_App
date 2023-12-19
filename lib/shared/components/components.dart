import 'package:anime_app/modules/anime_details_screen/anime_details_screen.dart';
import 'package:anime_app/styles/colors.dart';
import 'package:flutter/material.dart';

Widget gridViewItem(context) => InkWell(
  onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimeDetailsScreen()));
  },
  child: Card(
    elevation: 4,
    clipBehavior: Clip.hardEdge,
    child: Column(
      children: [
        const Image(image: AssetImage('assets/images/on_board_1.jpg'),fit: BoxFit.cover),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    height: 1,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ' 4.5 ',
                      style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.grey[600],),
                      textAlign: TextAlign.left,
                    ),
                    const Icon(Icons.star,color: Colors.yellow,size: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Text(
                '2001',
                style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.grey[600],),
                textAlign: TextAlign.right,
              ),
              const Spacer(),
              Text(
                'Episodes 24',
                style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.grey[600],),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);

Widget defaultGridView(context,bool physics) => GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 2,
    shrinkWrap: true,
    physics: physics ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
    children: List.generate(10, (index) => gridViewItem(context)));

Widget vListViewItem(context) => InkWell(
  onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimeDetailsScreen()));
  },
  child: SizedBox(
    height: 150,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: const Image(
            image: AssetImage('assets/images/on_board_1.jpg'),
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Movie Name',
                    style: Theme.of(context).textTheme.titleLarge),
                Text('Action Drama ',
                    style: Theme.of(context).textTheme.caption),
                Text(
                  '2h 30m',
                  style:
                  Theme.of(context).textTheme.caption?.copyWith(height: 1),
                ),
                const Spacer(),
                Row(
                  mainAxisSize:MainAxisSize.min,
                  children: [
                    FloatingActionButton.small(
                      onPressed: () {},
                      shape: const CircleBorder(),
                      backgroundColor: defaultColor,
                      foregroundColor: Colors.white,
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        size: 25,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      ' 4.5 ',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

