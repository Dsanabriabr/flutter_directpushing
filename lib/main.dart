import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'presentation/pages/link_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 0, 0)),
      ),
      home: const MyHomePage(title: 'App Lucas Mortimer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      ..loadRequest(Uri.parse('https://queroapoiar.com.br/thiago-dos-reis'));
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
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
        icon: const Icon(Icons.settings),
        onPressed: _toggleWebView,
      ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          WebViewWidget(controller: controller1),
          linkTreeController,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleWebView,
        child: const Icon(Icons.share),
        
      ),
      floatingActionButtonLocation: CustomFabLocation(),
    );
  }
}

class CustomFabLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Determine the X and Y coordinates
    // scaffoldGeometry.scaffoldSize provides the full screen dimensions
    double x = scaffoldGeometry.scaffoldSize.width - 80; // Custom X
    double y = scaffoldGeometry.scaffoldSize.height - 150; // Custom Y
    
    return Offset(x, y);
  }
}