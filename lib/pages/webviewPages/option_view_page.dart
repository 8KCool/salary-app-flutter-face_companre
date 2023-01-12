import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class MyOptionWebView extends StatefulWidget {
  final WebViewController controller;
  const MyOptionWebView({Key? key, required this.controller}) : super(key: key);

  @override
  State<MyOptionWebView> createState() => _MyOptionWebViewState();
}

class _MyOptionWebViewState extends State<MyOptionWebView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller:widget.controller);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
