import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:music_player/xutils/xtext.dart';
import 'package:video_player/video_player.dart';
import '../models/video_model.dart';

class PlayerScreen extends StatefulWidget {
  final VideoModel video;

  PlayerScreen({super.key, required this.video});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  Widget? videoWidget;

  @override
  void initState() {
    super.initState();
    final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        widget.video.getFullVideoLink()));

    videoPlayerController.initialize().then((chewieController){
      {
        final chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: true,
          looping: true,
        );

        videoWidget = Chewie(
          controller: chewieController,
        );
        setState(() {

        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
          title: XText(widget.video.title, color: Colors.white),
        leading: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: Center(
        child: Container(
          child: videoWidget ?? const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
