package com.example.flutter_qiniu_pili;

import android.content.Context;
import android.view.View;

import androidx.annotation.NonNull;

import com.pili.pldroid.player.AVOptions;
import com.pili.pldroid.player.widget.PLVideoView;

import java.util.Map;

import io.flutter.Log;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

public class FlutterQiniuPlayer implements PlatformView, MethodChannel.MethodCallHandler {
    @NonNull private final PLVideoView videoView;
    @NonNull private final MethodChannel methodChannel;

    FlutterQiniuPlayer(@NonNull Context context, BinaryMessenger messenger, int id, @NonNull Map creationParams) {
        videoView = new PLVideoView(context);
        methodChannel = new MethodChannel(messenger, "plugins.edram.qiniu_pili/player_" + id);
        methodChannel.setMethodCallHandler(this);

        Log.i("qiniu-player",creationParams.toString());

        AVOptions options = new AVOptions();
        options.setInteger(AVOptions.KEY_LOG_LEVEL, 5);
        videoView.setAVOptions(options);

        String videoPath = (String) creationParams.get("videoPath");

        videoView.setVideoPath(videoPath);
        videoView.start();
    }

    @NonNull
    @Override
    public View getView() {
        return videoView;
    }

    @Override
    public void dispose() {}

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        switch (call.method) {
            case "play":
                videoView.start();
                break;
            case "pause":
                videoView.pause();
                break;
            default:
                result.notImplemented();
        }
    }
}
