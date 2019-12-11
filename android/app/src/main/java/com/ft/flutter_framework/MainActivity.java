package com.ft.flutter_framework;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import androidx.core.content.FileProvider;

import java.io.File;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    //渠道名
    private static final String CHANNEL = "com.ft.demo/update";//渠道名

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        MethodChannel channel = new MethodChannel(getFlutterView(), CHANNEL);//获取渠道
        channel.setMethodCallHandler(this::handleMethod);//设置方法监听
    }

    /**
     * 处理方法回调监听
     *
     * @param methodCall 方法的参数相关
     * @param result     方法的返回值相关
     */
    private void handleMethod(MethodCall methodCall, MethodChannel.Result result) {
        switch (methodCall.method) {//根据方法名进行处理
            case "install":
                String path = methodCall.argument("path");
                String bundleId = methodCall.argument("bundleId");
                installApk(path, bundleId);//具体处理
                break;
            default:
                result.notImplemented();
        }
    }

    /**
     * 安装apk
     */
    private void installApk(String filePath, String bundleId) {
        File file = new File(filePath);
        Uri fileUri = FileProvider.getUriForFile(MainActivity.this,
                bundleId + ".my.fileprovider", file);
        Intent it = new Intent();
        it.setAction(Intent.ACTION_VIEW);
        it.setDataAndType(fileUri, "application/vnd.android.package-archive");
        it.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        it.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);// 防止打不开应用
        MainActivity.this.startActivity(it);
    }
}
