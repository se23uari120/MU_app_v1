import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../core/constants/colors.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<WebViewScreen> createState() => _State();
}

class _State extends State<WebViewScreen> {
  late final WebViewController _ctrl;
  bool _loading = true;
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _ctrl = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (p) =>
          setState(() => _progress = p / 100),
        onPageFinished: (_) =>
          setState(() => _loading = false),
      ))
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext _) => Scaffold(
    appBar: AppBar(
      backgroundColor: AppColors.primary,
      title: Text(widget.title,
        style: const TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold)),
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh, color: Colors.white),
          onPressed: _ctrl.reload),
      ],
      bottom: _loading ? PreferredSize(
        preferredSize: const Size.fromHeight(3),
        child: LinearProgressIndicator(
          value: _progress > 0 ? _progress : null,
          backgroundColor: AppColors.primaryDark,
          color: Colors.white)) : null,
    ),
    body: WebViewWidget(controller: _ctrl),
  );
}
