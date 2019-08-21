import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_demo/res.dart';

class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController _videoPlayerController;

  var progressMax = 0;
  var currentProgress;

  @override
  void initState() {
    _videoPlayerController =
        new VideoPlayerController.network(AssetsRes.video_url)
          ..initialize().then((_) {
            setState(() {});
            _videoPlayerController.addListener(() {
              _videoPlayerController.position.then((s) {
                currentProgress = s.inSeconds;
              });
            });
            _videoPlayerController.play();
            progressMax = _videoPlayerController.value.duration.inSeconds;
          });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _videoPlayerController.value.initialized
          ? ListView(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: Stack(
                    children: <Widget>[
                      VideoPlayer(_videoPlayerController),
//                      Center(
//                        child: CircularProgressIndicator(),
//                      )
                    ],
                  ),
                ),
                VideoProgressIndicator(
                  _videoPlayerController,
                  allowScrubbing: true,
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
