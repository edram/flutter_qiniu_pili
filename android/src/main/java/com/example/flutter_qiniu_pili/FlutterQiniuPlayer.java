package com.example.flutter_qiniu_pili;

import android.content.Context;
import android.view.View;

import androidx.annotation.NonNull;

import com.pili.pldroid.player.AVOptions;
import com.pili.pldroid.player.widget.PLVideoView;

import java.util.Map;

import io.flutter.Log;
import io.flutter.plugin.platform.PlatformView;

public class FlutterQiniuPlayer implements PlatformView {
    @NonNull private final PLVideoView videoView;

    FlutterQiniuPlayer(@NonNull Context context, int id, @NonNull Map creationParams) {
        videoView = new PLVideoView(context);

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
    public void onFlutterViewAttached(@NonNull View flutterView) {
        System.out.print("123123");
    }
}
