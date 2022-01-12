package com.example.flutter_qiniu_pili;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.platform.PlatformViewRegistry;

/** FlutterQiniuPiliPlugin */
public class FlutterQiniuPiliPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    PlatformViewRegistry platformViewRegistry = flutterPluginBinding.getPlatformViewRegistry();
    platformViewRegistry.registerViewFactory("flutter_qiniu_pili/textview", new FlutterQiniuTextFactory());
    platformViewRegistry.registerViewFactory("flutter_qiniu_pili/player", new FlutterQiniuPlayerFactory());

    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_qiniu_pili");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
