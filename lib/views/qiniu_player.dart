import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef QiniuPlayerCreatedCallback = void Function(
    QiniuPlayerController controller);

class QiniuPlayer extends StatefulWidget {
  final String videoPath;

  final QiniuPlayerCreatedCallback? onQiniuPlayerCreated;

  const QiniuPlayer(
    this.videoPath, {
    Key? key,
    this.onQiniuPlayerCreated,
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
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the text_view plugin');
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onQiniuPlayerCreated == null) {
      return;
    }
    widget.onQiniuPlayerCreated!(QiniuPlayerController(id));
  }
}

class QiniuPlayerController {
  QiniuPlayerController(int id)
      : channel = MethodChannel('plugins.edram.qiniu_pili/player_$id');

  final MethodChannel channel;

  Future<void> play() async {
    return channel.invokeMethod('play');
  }

  Future<void> pause() async {
    return channel.invokeMethod('pause');
  }
}
