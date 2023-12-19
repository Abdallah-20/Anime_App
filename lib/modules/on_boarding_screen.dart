import 'package:anime_app/layout/anime_layout.dart';
import 'package:anime_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

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

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const AnimeLayout()),
                  (route) => false,
            );
          }, child: const Text('SKIP')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  if (value == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
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
                const Spacer(),
                FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AnimeLayout()),
                          (route) => false,
                        );
                      } else {
                        boardController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    shape: const CircleBorder(),
                    backgroundColor: defaultColor,
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.arrow_forward_ios)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image(image: AssetImage(model.image)),
          )),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            model.body,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      );
}
