import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class BrowserMainPage extends StatefulWidget {
  @override
  _BrowserMainPageState createState() => _BrowserMainPageState();
}

class _BrowserMainPageState extends State<BrowserMainPage> {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  TextEditingController controller = TextEditingController();
  var urlString = "https://www.google.com/";

  launchUrl() {
    setState(() {
      urlString = controller.text;
      flutterWebviewPlugin.reloadUrl(urlString);
    });
  }

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen(
      (WebViewStateChanged wvs) {
        print(wvs.type);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: TextField(
          textInputAction: TextInputAction.search,
          textCapitalization: TextCapitalization.none,
          textAlign: TextAlign.left,
          showCursor: true,
          autocorrect: true,
          smartDashesType: SmartDashesType.enabled,
          enableSuggestions: true,
          cursorWidth: 2.0,
          cursorColor: Colors.lightBlueAccent,
          keyboardAppearance: Brightness.dark,
          autofocus: false,
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              border: InputBorder.none, hintText: "https:// Enter Url Here "),
          onSubmitted: (url) => launchUrl(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => launchUrl(),
          )
        ],
      ),
      url: urlString,
      withZoom: true,
    );
  }
}

//import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
//
//class WebViewTest extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return _WebViewTestState();
//  }
//}
//
//class _WebViewTestState extends State<WebViewTest> {
//  WebViewController _webViewController;
//  //String filePath = 'files/test.html';
//
//  String filePath = 'file:///android_asset/test.html';
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Webview Demo')),
//      body: WebView(
//        initialUrl: filePath,
//        javascriptMode: JavascriptMode.unrestricted,
//        onWebViewCreated: (WebViewController webViewController) {
//          _webViewController = webViewController;
//          //_loadHtmlFromAssets();
//        },
//      ),
//      floatingActionButton: FloatingActionButton(
//        child: const Icon(Icons.add),
//        onPressed: () {
//          _webViewController.evaluateJavascript('add(10, 10)');
//        },
//      ),
//    );
//  }
//
////  _loadHtmlFromAssets() async {
////    String fileHtmlContents = await rootBundle.loadString(filePath);
////    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
////        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
////        .toString());
////  }
//}
