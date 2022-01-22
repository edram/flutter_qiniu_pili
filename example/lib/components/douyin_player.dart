import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiniu_pili/flutter_qiniu_pili.dart';

class DouyinPlayerController extends ChangeNotifier {
  String url;
  QiniuPlayerController? qiniuController;
  bool? shouldPlay;

  DouyinPlayerController(this.url);

  void play() {
    shouldPlay = true;
    notifyListeners();
  }
}

class DouyinPlayer extends StatefulWidget {
  final DouyinPlayerController controller;

  const DouyinPlayer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _DouyinPlayerState createState() => _DouyinPlayerState();
}

class _DouyinPlayerState extends State<DouyinPlayer> {
  bool useQiniuPlayer = false;
  bool hideCover = false;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      // if (widget.controller.shouldPlay == true) {
      _swithToQiniuPlayer();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = widget.controller;
    return Stack(
      children: [
        const SizedBox.expand(),
        if (useQiniuPlayer)
          Positioned.fill(
            child: QiniuPlayer(
              controller.url,
              onQiniuPlayerCreated: (controller) {
                widget.controller.qiniuController = controller;
                controller.setVideoPath(widget.controller.url);
              },
              onPrepared: onPrepared,
            ),
          ),
        if (!hideCover)
          Positioned.fill(
            child: Image.network(
                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201812%2F07%2F20181207172854_mtrty.png&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1645425994&t=e6e61356d8f60b0e6de2351e252d2437"),
          ),
        Positioned(
          bottom: 0,
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  controller.qiniuController?.seekTo(0);
                  controller.qiniuController?.play();
                },
                child: const Text('从头播放'),
              )
            ],
          ),
        )
      ],
    );
  }

  void onPrepared(QiniuPlayerController controller, int time) {
    controller.play();
    setState(() {
      hideCover = true;
    });
  }

  void _swithToQiniuPlayer() {
    setState(() {
      useQiniuPlayer = true;
    });
  }
}
