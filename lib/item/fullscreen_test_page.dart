import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_demo/res.dart';

class FullScreenPage extends StatefulWidget {
  @override
  _FullScreenPageState createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenPage> {
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController =
        new VideoPlayerController.network(AssetsRes.video_url)
          ..initialize().then((_) {
            setState(() {});
            _videoPlayerController.play();
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Stack(
        children: <Widget>[
          Center(
            child: AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: Stack(
                children: <Widget>[
                  VideoPlayer(_videoPlayerController),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
