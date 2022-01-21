package com.example.flutter_qiniu_pili;

import android.content.Context;
import android.graphics.Color;
import android.view.View;

import androidx.annotation.NonNull;

import com.pili.pldroid.player.AVOptions;
import com.pili.pldroid.player.PlayerState;
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
    @NonNull private final String videoPath;

    FlutterQiniuPlayer(@NonNull Context context, BinaryMessenger messenger, int id, @NonNull Map creationParams) {
        videoView = new PLVideoView(context);
        videoView.setBackgroundColor(Color.TRANSPARENT);
        methodChannel = new MethodChannel(messenger, "plugins.edram.qiniu_pili/player_" + id);
        methodChannel.setMethodCallHandler(this);

        Log.i("qiniu-player",creationParams.toString());

        AVOptions options = new AVOptions();
        options.setInteger(AVOptions.KEY_LOG_LEVEL, 5);
        videoView.setAVOptions(options);
        videoView.setLooping(true);
//        videoView.setDisplayAspectRatio(PLVideoView.ASPECT_RATIO_PAVED_PARENT);

        videoPath = (String) creationParams.get("videoPath");
    }

    @NonNull
    @Override
    public View getView() {
        return videoView;
    }

    @Override
    public void dispose() {
        Log.i("qiniu-player","wahahahahahahahahhahahahahahahahahahaahhahah");
        methodChannel.setMethodCallHandler(null);
        videoView.stopPlayback();
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        switch (call.method) {
            case "play":
                if(videoView.getPlayerState() == PlayerState.IDLE){
                    videoView.setVideoPath(videoPath);
                }
                videoView.start();
                break;
            case "pause":
                videoView.pause();
                break;
            case "seekTo":
                Long time= new Long(String.valueOf(call.arguments));//first way.
                videoView.seekTo(time);
                break;
            default:
                result.notImplemented();
        }
    }
}
