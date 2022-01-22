import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class TextView extends StatefulWidget {
  final bool useHybridComposition;

  const TextView({
    Key? key,
    this.useHybridComposition = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  @override
  Widget build(BuildContext context) {
    const String viewType = 'flutter_qiniu_pili/textview';
    const Map<String, dynamic> creationParams = <String, dynamic>{};

    if (defaultTargetPlatform == TargetPlatform.android) {
      if (widget.useHybridComposition) {
        return PlatformViewLink(
          viewType: viewType,
          surfaceFactory:
              (BuildContext context, PlatformViewController controller) {
            return AndroidViewSurface(
              controller: controller as AndroidViewController,
              gestureRecognizers: const <
                  Factory<OneSequenceGestureRecognizer>>{},
              hitTestBehavior: PlatformViewHitTestBehavior.opaque,
            );
          },
          onCreatePlatformView: (PlatformViewCreationParams params) {
            return PlatformViewsService.initSurfaceAndroidView(
              id: params.id,
              viewType: viewType,
              layoutDirection: TextDirection.rtl,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
              onFocus: () {
                params.onFocusChanged(true);
              },
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..create();
          },
        );
      }

      return const AndroidView(viewType: viewType);
    }

    return Text(
        '$defaultTargetPlatform is not yet supported by the text_view plugin');
  }
}
