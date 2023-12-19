import 'package:anime_app/styles/colors.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:video_player/video_player.dart';

class AnimeDetailsScreen extends StatefulWidget {
  const AnimeDetailsScreen({super.key});

  @override
  State<AnimeDetailsScreen> createState() => _AnimeDetailsScreenState();
}

class _AnimeDetailsScreenState extends State<AnimeDetailsScreen> {
  bool overflow = true;
  bool isPlaying = false;
  bool isEpisodesShown = false;
  bool video = false;
  late VideoPlayerController videoController;
  ChewieController? chewieController;
  final PanelController panelController = PanelController();

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    )..initialize().then((value) {
        setState(() {
          video = true;
        });
      });
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    videoController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 20)),
        actions: [
          IconButton(
              onPressed: () {
              }, icon: const Icon(Icons.bookmark_add_outlined))
        ],
      ),
      body: SlidingUpPanel(
        controller: panelController,
        minHeight: MediaQuery.of(context).size.height * 0.1,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        panel: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    setState(() {
                      panelController.isPanelOpen
                          ? panelController.close()
                          : panelController.open();
                    });
                  },
                  child: Center(
                      child: Container(
                          width: 40,
                          height: 8,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12)))),
                ),
                const SizedBox(height: 10),
                const Center(child: Text('Series Name/Seasons')),
                ListView.separated(
                  padding: const EdgeInsets.only(top: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          child: const Row(
                            children: [
                              Text('Season 1'),
                              Spacer(),
                              Icon(Icons.keyboard_arrow_down_outlined),
                            ],
                          ),
                          onTap: () => setState(() {
                            isEpisodesShown = !isEpisodesShown;
                          }),
                        ),
                        AnimatedSize(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                          child: SizedBox(
                            height: isEpisodesShown ? null : 0.0,
                            child: ListView.separated(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 15),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: AspectRatio(
                                          aspectRatio:
                                          videoController.value.aspectRatio,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: VideoPlayer(videoController),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            const Text('Episode 1'),
                                            Text('Name of The Episode ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                    color: Colors.grey[800])),
                                            Text('1h 13m',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                    color: Colors.grey[800])),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          child: FloatingActionButton.small(
                                            onPressed: () {},
                                            shape: const CircleBorder(),
                                            backgroundColor: defaultColor,
                                            foregroundColor: Colors.white,
                                            child: const Icon(Icons.play_arrow_rounded),
                                          )),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5),
                                  child: Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: Colors.black54),
                                ),
                                itemCount: 10,
                              ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                    child: Container(
                        width: double.infinity, height: 1, color: Colors.black54),
                  ),
                  itemCount: 3,
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment(0, 0.6),
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.white10],
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstIn,
                    child: const Image(
                      image: AssetImage('assets/images/on_board_1.jpg'),
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
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
                                    .bodySmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                textAlign: TextAlign.left,
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Story',
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          overflow = !overflow;
                        });
                      },
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        maxLines: overflow ? 4 : null,
                        overflow: overflow ? TextOverflow.ellipsis : null,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey[700]),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Gallery',
                            style: Theme.of(context).textTheme.titleLarge),
                        const Spacer(),
                        TextButton(
                            onPressed: () {}, child: const Text("See all")),
                      ],
                    ),
                    video
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                isPlaying = true;
                                chewieController = ChewieController(
                                  videoPlayerController: videoController,
                                  autoPlay: true,
                                  looping: true,
                                );
                              });
                            },
                            child: AspectRatio(
                              aspectRatio: videoController.value.aspectRatio,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child: isPlaying
                                      ? Chewie(
                                          controller: chewieController!,
                                        )
                                      : Stack(
                                          alignment: Alignment.center,
                                          children: [
                                              VideoPlayer(videoController),
                                              Container(
                                                color: Colors.black45,
                                              ),
                                              const CircleAvatar(
                                                  backgroundColor:
                                                      Colors.black54,
                                                  radius: 25,
                                                  child: Icon(
                                                    Icons.play_arrow,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ))
                                            ]),
                                ),
                              ),
                            ),
                          )
                        : const Center(child: CircularProgressIndicator()),
                    Row(
                      children: [
                        Text('Reviews',
                            style: Theme.of(context).textTheme.titleLarge),
                        const Spacer(),
                        TextButton(
                            onPressed: () {}, child: const Text("See all")),
                      ],
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 250,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/on_board_1.jpg')),
                                        const SizedBox(width: 15),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Abdallah Adel'),
                                            Text(
                                              '@abdullah_12',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color: Colors.grey[700]),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.star_border,
                                            color: Colors.amber[300]),
                                        Icon(Icons.star_border,
                                            color: Colors.amber[300]),
                                        Icon(Icons.star_border,
                                            color: Colors.amber[300]),
                                        Icon(Icons.star_border,
                                            color: Colors.amber[300]),
                                        Icon(Icons.star_border,
                                            color: Colors.amber[300]),
                                        const Spacer(),
                                        Text('1m ago',
                                            style: TextStyle(
                                                color: Colors.grey[700])),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        itemCount: 10,
                      ),
                    ),
                    Text('Similar',
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 120,
                            child: Card(
                              clipBehavior: Clip.hardEdge,
                              child: Column(
                                children: [
                                  const Expanded(
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/on_board_1.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Movie Name"),
                                        Row(
                                          children: [
                                            Text(
                                              '2h 13m',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color: Colors.grey[700]),
                                            ),
                                            const Spacer(),
                                            Icon(Icons.star,
                                                color: Colors.amber[300]),
                                            Text(
                                              '4.0',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color: Colors.grey[700]),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        itemCount: 10,
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
