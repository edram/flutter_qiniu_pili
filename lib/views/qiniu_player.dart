import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QiniuPlayer extends StatefulWidget {
  const QiniuPlayer({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QiniuPlayerState();
}

class _QiniuPlayerState extends State<QiniuPlayer> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return const AndroidView(
        viewType: 'flutter_qiniu_pili/player',
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the text_view plugin');
  }
}
