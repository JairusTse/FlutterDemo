package com.ft.flutter_framework;

import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

/**
 * 作者： JairusTse
 * 日期： 2019-11-06
 */
public class MyApplication extends FlutterApplication implements PluginRegistry.PluginRegistrantCallback {
    @Override
    public void registerWith(PluginRegistry registry) {
        //
        // Integration note:
        //
        // In Flutter, in order to work in background isolate, plugins need to register with
        // a special instance of `FlutterEngine` that serves for background execution only.
        // Hence, all (and only) plugins that require background execution feature need to
        // call `registerWith` in this method.
        //
        // The default `GeneratedPluginRegistrant` will call `registerWith` of all plugins
        // integrated in your application. Hence, if you are using `FlutterDownloaderPlugin`
        // along with other plugins that need UI manipulation, you should register
        // `FlutterDownloaderPlugin` and any 'background' plugins explicitly like this:
        //
        // FlutterDownloaderPlugin.registerWith(registry.registrarFor("vn.hunghd.flutterdownloader.FlutterDownloaderPlugin"));
        //
        GeneratedPluginRegistrant.registerWith(registry);
    }
}
