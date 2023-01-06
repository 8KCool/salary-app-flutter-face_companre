import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class SettingsPage extends StatefulWidget {
  final WebViewController controller;
  const SettingsPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller:widget.controller);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
