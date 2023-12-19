import 'package:anime_app/styles/colors.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool overflow = true;
  bool isPlaying = false;
  late VideoPlayerController videoController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    )..initialize();
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
            icon: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade300,
                child: const Icon(Icons.arrow_back_ios, size: 20))),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark))
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: videoController.value.aspectRatio,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: VideoPlayer(videoController),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
