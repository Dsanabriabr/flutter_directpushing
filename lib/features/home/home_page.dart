import 'package:flutter/material.dart';
import 'package:mvp_politician_app/features/home/home_appbar.dart';
import 'package:mvp_politician_app/features/home/home_floating_button.dart';
import 'package:mvp_politician_app/features/pages/link_tree.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int currentIndex = 0;

  late final WebViewController controller1;
  late final WebViewController controller2;
  late final LinkTreePage linkTreeController;

  bool isMenuOpen = false;

  void toggleMenu() {

    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  void initState() {
    super.initState();
    controller2 = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://queroapoiar.com.br/lucasmortimer'));
    controller1 = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.instagram.com/lucasmortimer/reels/'));

    linkTreeController = LinkTreePage();
  }
  void _toggleWebView() {
    setState(() {
      currentIndex = currentIndex == 0 ? 1 : 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: widget.title,
        onTapLeadingButton: _toggleWebView,
        onTapTrailingButton: _toggleWebView,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          WebViewWidget(controller: controller2),
          linkTreeController,
        ],
      ),
      floatingActionButton: HomeFloatingButton(onTap: toggleMenu),
      floatingActionButtonLocation: HomeFloatingButtonLocation(),
    );
  }
}