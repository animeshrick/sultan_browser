import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
//
//class BrowserMainPage extends StatefulWidget {
//  @override
//  _BrowserMainPageState createState() => _BrowserMainPageState();
//}
//
//class _BrowserMainPageState extends State<BrowserMainPage> {
//  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
//  TextEditingController controller = TextEditingController();
//  var urlString = "https://www.google.com/";
//
//  launchUrl() {
//    setState(() {
//      urlString = controller.text;
//      flutterWebviewPlugin.reloadUrl(urlString);
//    });
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    flutterWebviewPlugin.onStateChanged.listen(
//      (WebViewStateChanged wvs) {
//        print(wvs.type);
//      },
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return WebviewScaffold(
//      appBar: AppBar(
//        title: TextField(
//          textInputAction: TextInputAction.search,
//          textCapitalization: TextCapitalization.none,
//          textAlign: TextAlign.left,
//          showCursor: true,
//          autocorrect: true,
//          smartDashesType: SmartDashesType.enabled,
//          enableSuggestions: true,
//          cursorWidth: 2.0,
//          cursorColor: Colors.lightBlueAccent,
//          keyboardAppearance: Brightness.dark,
//          autofocus: false,
//          controller: controller,
//          style: TextStyle(color: Colors.white),
//          decoration: InputDecoration(
//              border: InputBorder.none, hintText: "https:// Enter Url Here "),
//          onSubmitted: (url) => launchUrl(),
//        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.navigate_next),
//            onPressed: () => launchUrl(),
//          )
//        ],
//      ),
//      url: urlString,
//      withZoom: true,
//    );
//  }
//}

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

class MyHomePage extends StatefulWidget {
  MyHomePage(BuildContext context);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewController _webViewController;
  TextEditingController _teController = new TextEditingController();
  bool showLoading = false;

  void updateLoading(bool ls) {
    this.setState(() {
      showLoading = ls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.deepOrange,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                            flex: 2,
                            child: Text(
                              "http://",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                        Flexible(
                          flex: 4,
                          child: TextField(
                            autocorrect: false,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.white,
                                      width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.white,
                                      width: 2),
                                )),
                            controller: _teController,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Center(
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  String finalURL = _teController.text;
                                  if (!finalURL.startsWith("https://")) {
                                    finalURL = "https://" + finalURL;
                                  }
                                  if (_webViewController != null) {
                                    updateLoading(true);
                                    _webViewController
                                        .loadUrl(finalURL)
                                        .then((onValue) {})
                                        .catchError((e) {
                                      updateLoading(false);
                                    });
                                  }
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                  flex: 9,
                  child: Stack(
                    children: <Widget>[
                      WebView(
                        initialUrl: 'http://google.com',
                        onPageFinished: (data) {
                          updateLoading(false);
                        },
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated: (webViewController) {
                          _webViewController = webViewController;
                        },
                      ),
                      (showLoading)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Center()
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
