import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextView extends StatefulWidget {
  const TextView({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return const AndroidView(
        viewType: 'flutter_qiniu_pili/textview',
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the text_view plugin');
  }
}
