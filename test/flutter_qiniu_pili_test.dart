import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_qiniu_pili/flutter_qiniu_pili.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_qiniu_pili');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterQiniuPili.platformVersion, '42');
  });
}
