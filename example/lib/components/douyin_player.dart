import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiniu_pili/flutter_qiniu_pili.dart';

class DouyinPlayerController {
  QiniuPlayerController? qiniuController;

  void play() {
    qiniuController?.play();
  }

  void restart() {
    qiniuController?.seekTo(0);
    qiniuController?.play();
  }

  void pause() {
    qiniuController?.pause();
  }
}

class DouyinPlayer extends StatefulWidget {
  final String url;

  final DouyinPlayerController controller;

  const DouyinPlayer(
    this.url, {
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _DouyinPlayerState createState() => _DouyinPlayerState();
}

class _DouyinPlayerState extends State<DouyinPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      child: QiniuPlayer(
        widget.url,
        onQiniuPlayerCreated: (controller) {
          widget.controller.qiniuController = controller;
        },
      ),
    );
  }
}
