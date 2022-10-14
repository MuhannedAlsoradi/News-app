import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebVeiwScreen extends StatelessWidget {
  String? url;
  String? name;

  WebVeiwScreen({required this.url, required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name ?? 'Web veiw'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
