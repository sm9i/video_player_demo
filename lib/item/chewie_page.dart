import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_demo/res.dart';

class ChewiePage extends StatefulWidget {
  @override
  _ChewiePageState createState() => _ChewiePageState();
}

class _ChewiePageState extends State<ChewiePage> {
  VideoPlayerController _videoPlayerController =
      new VideoPlayerController.network(AssetsRes.video_url);

  ChewieController _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Chewie(
      controller: _chewieController,
    ));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
