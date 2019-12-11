import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_framework/constants/constants.dart';
import 'package:flutter_framework/res/colors.dart';
import 'package:flutter_framework/util/request.dart';
import 'package:flutter_framework/widget/progress_dialog_layout.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

// 应用页面使用有状态Widget
class RecommendPage extends StatefulWidget {
  @override
  RecommendPageState createState() => RecommendPageState();
}

class RecommendPageState extends State<RecommendPage> {
  String buildNumber = ""; //版本号
  String packageName = ""; //包名
  String _externalDocumentsDirectory; //返回存储目录
  String _appPath; //更新安装包的路径

  bool _loading = false;
  int countTemp = 0; //下载进度
  int totalTemp = 0; //文件总大小
  String _loadingMsg = "";

  String apkUrl = "http://ipythondev.com/demo-debug-v1.1.5.apk"; //apk下载地址
  String plistUrl; //plist下载地址（企业版）
  String appstoreUrl; //打开appstore下载地址（非企业版）

  @override
  void initState() {
    Constants.requestExternalStorageDirectory().then((path) {
      _externalDocumentsDirectory = path;
      _appPath = _externalDocumentsDirectory + "/app-release.apk";
    });

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      buildNumber = packageInfo.buildNumber;
      packageName = packageInfo.packageName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProgressDialog(
      loading: _loading,
      msg: _loadingMsg,
      child: Scaffold(
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                '我的',
                textAlign: TextAlign.center,
                style: new TextStyle(
                    color: Colors.red[500],
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              RaisedButton(
                child: Text("检查更新"),
                onPressed: () {
                  //检查更新
                  _checkUpdate();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  ///检查更新
  Future<Null> _checkUpdate() async {
    /// TODO 这里应该调用检查更新接口，目前先写死下载地址
    showDialog(
      // 设置点击 dialog 外部不取消 dialog，默认能够取消
      barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
        child: AlertDialog(
          title: Text('提示'),
          // 标题文字样式
          content: Text("有新版本，是否更新？"),
          // 内容文字样式
          backgroundColor: MyColors.white,
          elevation: 8.0,
          // 投影的阴影高度
          semanticLabel: 'Label',
          // 这个用于无障碍下弹出 dialog 的提示
          shape: Border.all(),
          // dialog 的操作按钮，actions 的个数尽量控制不要过多，否则会溢出 `Overflow`
          actions: <Widget>[
            // 点击取消按钮
            FlatButton(
                onPressed: (() {
                  Navigator.pop(context);
                }),
                child: Text(
                  '取消',
                  style: TextStyle(color: MyColors.ff828282),
                )),
            FlatButton(
                onPressed: (() {
                  Navigator.pop(context);

                  if (Platform.isIOS) {
                    //iOS企业版打开下载地址（非企业版直接打开appstore）
                    _launchURL(plistUrl);
                  } else {
                    //android直接下载安装包
                    executeDownload(apkUrl);
                  }
                }),
                child: Text('更新')),

            // 点击打开按钮
          ],
        ),
      ),
    );
  }

  /// 打开网页
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// 下载文件
  Future<Null> executeDownload(String url) async {
    Fluttertoast.showToast(msg: "开始下载");

    setState(() {
      _loading = true;
    });

    Request.downloadFile(
        url: url,
        path: _appPath,
        onProgress: (count, total) {
          String percent = (count / total * 100).toStringAsFixed(1) + "%";
          print(percent);

          //显示下载进度
          setState(() {
            _loadingMsg = percent;
          });
        },
        onError: (code, message) {
          Fluttertoast.showToast(msg: "下载失败");
          print(message);
          setState(() {
            _loading = false;
          });
        }).then((succeed) {
      Navigator.pop(context);
      setState(() {
        _loading = false;
      });
      if (succeed) {
        print("当下载完成时，调用安装");
        _installApk(_appPath);
      }
    });
  }

  // 调用android代码安装apk
  void _installApk(String path) {
    try {
      const platform = MethodChannel("com.ft.demo/update");
      // 调用app地址
      platform.invokeMethod('install', {"bundleId": packageName, "path": path});
    } on PlatformException catch (_) {}
  }
}
