import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DummyWeb extends StatefulWidget {
  const DummyWeb({super.key});

  @override
  State<DummyWeb> createState() => _DummyWebState();
}

class _DummyWebState extends State<DummyWeb> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(
                'https://backup.qurango.net/radio/ahmad_khader_altarabulsi')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
