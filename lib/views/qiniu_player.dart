import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QiniuPlayer extends StatefulWidget {
  final String videoPath;

  const QiniuPlayer(
    this.videoPath, {
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QiniuPlayerState();
}

class _QiniuPlayerState extends State<QiniuPlayer> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'flutter_qiniu_pili/player',
        creationParams: {
          'videoPath': widget.videoPath,
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the text_view plugin');
  }
}
