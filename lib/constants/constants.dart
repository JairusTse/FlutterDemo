
import 'dart:io';

import 'package:flutter_framework/util/string_util.dart';
import 'package:path_provider/path_provider.dart';

/// 常量
class Constants {

    /// 99api的apikey
    static String apiKey = "81031796CBFC1CBDB04E6B78C03EE426";
    ///请求成功code
    static int codeSucceed = 0000;
    ///网络异常code
    static int codeNetError = -1;

    static String _externalDocumentsDirectory; //存储目录

    static Future<String> requestExternalStorageDirectory() async {
        if (StringUtil.isEmpay(_externalDocumentsDirectory)) {
            Directory externalDir;
            if (Platform.isAndroid) {
                //android系统返回外部存储目录
                externalDir = await getExternalStorageDirectory();
            } else {
                //ios系统返回文档目录
                externalDir = await getApplicationDocumentsDirectory();
            }
            _externalDocumentsDirectory = externalDir.path;
        }

        return _externalDocumentsDirectory;
    }
}