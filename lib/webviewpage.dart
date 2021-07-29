import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async';

class AddMoneyWebview extends StatefulWidget {
  final String initialUrl; // http://payment.zuzasif.info/checkout?amount=514&type=dotpay&user_id=3
  const AddMoneyWebview({Key key, this.initialUrl}) : super(key: key);
  @override
  _AddMoneyWebviewState createState() => _AddMoneyWebviewState();
}

class _AddMoneyWebviewState extends State<AddMoneyWebview> {

  StreamSubscription<String> _onStateChanged;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  // ignore: prefer_collection_literals
  final Set<JavascriptChannel> jsChannels = [
    JavascriptChannel(
        name: 'Print',
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
        }),
  ].toSet();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onStateChanged =
        flutterWebviewPlugin.onUrlChanged.listen((String state) async {
          if (state.toLowerCase().contains('success'.toLowerCase())) {
            // do whatever you want
            Navigator.of(context).pop();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.initialUrl,
      javascriptChannels: jsChannels,
      mediaPlaybackRequiresUserGesture: false,
      appBar: AppBar(
        title: const Text('Payment',),backgroundColor: Color(0xfff9A825),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.white,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  }
}
