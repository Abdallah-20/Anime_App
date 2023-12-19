import 'package:anime_app/modules/new_screen/new_screen.dart';
import 'package:anime_app/modules/on_boarding_screen.dart';
import 'package:anime_app/modules/popular_screen/popular_screen.dart';
import 'package:anime_app/shared/components/components.dart';
import 'package:anime_app/styles/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int carouselPageIndicator = 0;

  @override
  Widget build(BuildContext context) {
    List<BoardingModel> boarding = [
      BoardingModel(
          image: 'assets/images/on_board_1.jpg',
          title: 'On Board Title 1',
          body: 'On Board Body 1'),
      BoardingModel(
          image: 'assets/images/on_board_1.jpg',
          title: 'On Board Title 2',
          body: 'On Board Body 2'),
      BoardingModel(
          image: 'assets/images/on_board_1.jpg',
          title: 'On Board Title 3',
          body: 'On Board Body 3'),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CarouselSlider(
                  items: boarding
                      .map((e) => Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: ShaderMask(
                              shaderCallback: (rect) {
                                return const LinearGradient(
                                  begin: Alignment(0, 0.6),
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.black, Colors.white10],
                                ).createShader(rect);
                              },
                              blendMode: BlendMode.dstIn,
                              child: Image(
                                image: AssetImage(e.image),
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    height: 370,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        carouselPageIndicator = index;
                      });
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 10.0, bottom: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              'Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  Movie  ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(height: 1),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Movie  Movie  Movie',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                            AnimatedSmoothIndicator(
                              activeIndex: carouselPageIndicator,
                              count: boarding.length,
                              effect: const ExpandingDotsEffect(
                                dotColor: Colors.grey,
                                activeDotColor: defaultColor,
                                dotHeight: 10,
                                dotWidth: 10,
                                expansionFactor: 4,
                                spacing: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: FloatingActionButton.small(
                      onPressed: () {},
                      shape: const CircleBorder(),
                      backgroundColor: defaultColor,
                      foregroundColor: Colors.white,
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        size: 25,
                      ),
                    )),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Popular',
                          style: Theme.of(context).textTheme.subtitle1),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PopularScreen(),
                              ));
                        },
                        child: Row(
                          children: [
                            Text('See all  ',
                                style: Theme.of(context).textTheme.caption),
                            const Icon(Icons.arrow_forward_ios, size: 10),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 164,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => SizedBox(
                        width: 160,
                        child: gridViewItem(context),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('New', style: Theme.of(context).textTheme.subtitle1),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewScreen(),
                              ));
                        },
                        child: Row(
                          children: [
                            Text('See all  ',
                                style: Theme.of(context).textTheme.caption),
                            const Icon(Icons.arrow_forward_ios, size: 10),
                          ],
                        ),
                      )
                      // Expanded(
                      //   child: ElevatedButton(
                      //     onPressed: () {},
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Colors.white10,
                      //       shape: const RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.only(
                      //             topLeft: Radius.circular(12),
                      //             bottomLeft: Radius.circular(12)),
                      //       ),
                      //     ),
                      //     // autofocus: true,
                      //     child:  Text('Popular',style: Theme.of(context).textTheme.subtitle1,),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 164,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => SizedBox(
                        width: 160,
                        child: gridViewItem(context),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),

            // MediaQuery.removePadding(
            //   context: context,
            //   removeTop: true,
            //   child: defaultGridView(context, true),
            // ),
          ],
        ),
      ),
    );
  }
}
