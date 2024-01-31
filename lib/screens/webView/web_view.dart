import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'navigation.dart';

class WebScreenView extends StatefulWidget {
  final String url;

   WebScreenView(this.url);
  @override
  State<WebScreenView> createState() => _WebScreenViewState();
}

class _WebScreenViewState extends State<WebScreenView> {

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          NavigationControls(
            controller: controller,
          ),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
