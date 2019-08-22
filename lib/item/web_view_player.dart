import 'package:flutter/material.dart';
import 'package:video_player_demo/res.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  var _title = '正在加载...';
  WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: WebView(
        initialUrl: "${AssetsRes.video_url}",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (c) {
          _webViewController = c;
        },
        onPageFinished: (url) {
          _webViewController
              ?.evaluateJavascript("document.title")
              ?.then((title) {
            setState(() {
              _title = title.replaceAll("\"", "");
            });
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
