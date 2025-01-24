import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieTest extends StatefulWidget {
  const ChewieTest({super.key});

  @override
  State<ChewieTest> createState() => _ChewieTestState();
}

class _ChewieTestState extends State<ChewieTest> {
  Widget? video;
  @override
  void initState() {
    super.initState();
    final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        'https://drive.google.com/uc?id=1hxv16B_yK57WbR8gzzRxY6LyCKNpdkDS'));
    videoPlayerController.initialize().then((chewieController){
      {
        final chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: true,
          looping: true,
        );

        video = Chewie(
          controller: chewieController,
        );
        setState(() {

        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return video ?? Container();
  }
}
