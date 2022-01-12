import 'package:flutter/material.dart';

import 'package:flutter_qiniu_pili/views/qiniu_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          child: const QiniuPlayer(),
        ),
      ),
    );
  }
}
