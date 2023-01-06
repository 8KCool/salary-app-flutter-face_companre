import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class MyAccountPage extends StatefulWidget {
  final WebViewController controller;
  const MyAccountPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller:widget.controller);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
