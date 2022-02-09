import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isAndroid) {
  //   await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  // }
  runApp( MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MyInAppBrowser browser = new MyInAppBrowser();
   late InAppWebViewController _webViewController;
  var options = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(javaScriptEnabled: true,mediaPlaybackRequiresUserGesture: false)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InAppBrowser Example'),
      ),
      body: Center(
        child:  InAppWebView(
            //initialUrl: "https://meet.jit.si/hello",
            initialUrlRequest:
            URLRequest(url: Uri.parse("https://meet.jit.si/chuzeday-62039b9ba0ac7-1644403611")),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                mediaPlaybackRequiresUserGesture: false,
                javaScriptEnabled: true,

                //debuggingEnabled: true,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;
            },
            androidOnPermissionRequest:
                (InAppWebViewController controller, String origin,
                List<String> resources) async {
              return PermissionRequestResponse(
                  resources: resources,
                  action: PermissionRequestResponseAction.GRANT);
            }),
      ),

        // ElevatedButton(
        //     onPressed: () async{
        //
        //       var camstatus = await Permission.camera.status;
        //       var micstatus = await Permission.microphone.status;
        //       print(camstatus);
        //       print(micstatus);
        //       if(camstatus.isDenied){
        //         await Permission.camera.request();
        //       }
        //       if(micstatus.isDenied){
        //         await Permission.microphone.request();
        //       }
        //
        //       if(camstatus.isGranted && micstatus.isGranted){
        //         browser.openUrlRequest(
        //             urlRequest: URLRequest(url: Uri.parse("https://meet.jit.si/chuzeday-62039b9ba0ac7-1644403611")),
        //             options: options
        //
        //         );
        //       }
        //
        //
        //     },
        //     child: Text("Open InAppBrowser")),

    );
  }
}

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("Browser Created!");
  }

  @override
  Future onLoadStart(url) async {
    print("Started $url");
  }

  @override
  Future onLoadStop(url) async {
    print("Stopped $url");
  }

  @override
  void onLoadError(url, code, message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("Browser closed!");
  }
}

class Mhe extends StatefulWidget {
  const Mhe({Key? key}) : super(key: key);

  @override
  _MheState createState() => _MheState();
}

class _MheState extends State<Mhe> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


