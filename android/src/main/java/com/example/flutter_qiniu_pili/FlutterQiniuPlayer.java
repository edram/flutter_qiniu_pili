package com.example.flutter_qiniu_pili;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.pili.pldroid.player.AVOptions;
import com.pili.pldroid.player.widget.PLVideoView;

import java.util.Map;

import io.flutter.plugin.platform.PlatformView;

public class FlutterQiniuPlayer implements PlatformView {
    @NonNull private final PLVideoView videoView;

    FlutterQiniuPlayer(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams) {
        videoView = new PLVideoView(context);

        AVOptions options = new AVOptions();
        options.setInteger(AVOptions.KEY_LOG_LEVEL, 5);
        videoView.setAVOptions(options);

        videoView.setVideoPath("http://demo-videos.qnsdk.com/movies/qiniu.mp4");
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
