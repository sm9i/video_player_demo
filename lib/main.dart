import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player_demo/item/chewie_page.dart';
import 'package:video_player_demo/item/fullscreen_test_page.dart';
import 'package:video_player_demo/item/ijk_player_page.dart';
import 'package:video_player_demo/item/video_player_page.dart';
import 'package:video_player_demo/item/web_view_player.dart';
import 'package:video_player_demo/util/no_splash.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // splashFactory: NoSplashFactory(),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                go(VideoPlayerPage());
              },
              child: Text('video_player'),
              color: Colors.red,
            ),
            MaterialButton(
              onPressed: () {
                go(ChewiePage());
              },
              child: Text('chewie'),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                go(IjkPlayerPage());
              },
              child: Text('ijk'),
              color: Colors.orange,
            ),
            MaterialButton(
              onPressed: () {
                go(FullScreenPage());
              },
              child: Text('full screen'),
              color: Colors.cyan,
            ),
            MaterialButton(
              onPressed: () {
                go(WebViewPage());
              },
              child: Text('web_view'),
              color: Colors.cyan,
            ),
            TextField(
              decoration: InputDecoration(hintText: '水波纹'),
            ),
            Theme(
              data:
                  Theme.of(context).copyWith(splashFactory: NoSplashFactory()),
              child: TextField(
                decoration: InputDecoration(hintText: '无水波纹'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future go(Widget child) {
    return Navigator.push(
        context, new MaterialPageRoute(builder: (_) => child));
  }
}
