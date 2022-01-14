import 'package:flutter/material.dart';
import 'package:flutter_qiniu_pili/flutter_qiniu_pili.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late QiniuPlayerController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          color: Colors.black,
          child: QiniuPlayer(
            "http://demo-videos.qnsdk.com/movies/qiniu.mp4",
            onQiniuPlayerCreated: (controller) {
              this.controller = controller;
            },
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            TextButton(
              onPressed: () {
                controller.pause();
              },
              child: const Text('暂停'),
            ),
            TextButton(
              onPressed: () {
                controller.play();
              },
              child: const Text('播放'),
            ),
          ],
        ),
      ),
    );
  }
}
