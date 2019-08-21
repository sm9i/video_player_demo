import 'package:flutter/material.dart';

import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:video_player_demo/res.dart';

class IjkPlayerPage extends StatefulWidget {
  @override
  _IjkPlayerStatePage createState() => _IjkPlayerStatePage();
}

class _IjkPlayerStatePage extends State<IjkPlayerPage> {
  IjkMediaController _ijkMediaController;

  @override
  void initState() {
    _ijkMediaController = new IjkMediaController();
    super.initState();
  }

  void play() async {
    await _ijkMediaController.setNetworkDataSource(AssetsRes.video_url,
        autoPlay: true);
    print("set data source success");
    VideoInfo info = await _ijkMediaController.getVideoInfo();
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 230,
            child: IjkPlayer(mediaController: _ijkMediaController),
          )
        ],
      ),
      floatingActionButton: IconButton(
          icon: Icon(Icons.play_arrow),
          onPressed: () {
            play();
          }),
    );
  }

  @override
  void dispose() {
    _ijkMediaController.dispose();
    super.dispose();
  }
}
