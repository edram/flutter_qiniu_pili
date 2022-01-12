
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterQiniuPili {
  static const MethodChannel _channel = MethodChannel('flutter_qiniu_pili');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
