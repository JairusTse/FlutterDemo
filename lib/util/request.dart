import 'package:flutter/foundation.dart';
import 'package:flutter_framework/api/api.dart';
import 'package:flutter_framework/constants/constants.dart';
import 'package:flutter_framework/model/message_entity.dart';

import 'http.dart';

/// 网络请求
class Request {
  static Http http = Http();

  ///
  /// 获取今日头条资讯
  ///
  static Future<MessageEntity> getMessage(
      {@required String tag,
      @required int page,
      @required onError(int code, String message)}) async {
    var from = {
      "apikey": Constants.apiKey,
      "tag": tag,
      "page": page,
    };
    var response =
        await http.get(url: API.getMessage, params: from, onError: onError);


    if (response != null) {
      if (response["retcode"] == "0000") {
        MessageEntity messageEntity =
        MessageEntity.fromJson(response);
        return messageEntity;
      } else {
        onError(response["retcode"], "请求异常，请联系管理员");
        return null;
      }
    } else {
      // response为null,表示网络出错,
      // onError()方法会在http._request()内调用.
      return null;
    }

  }

  /// 下载文件
  static Future<bool> downloadFile(
      {@required String url,
        @required String path,
        @required onProgress(int count, int total),
        @required onError(int code, String message)}) async {
    var response = await Http(hasTimeout: false).downloadFile(
        url: url, path: path, onProgress: onProgress, onError: onError);

    if (response) {
      return true;
    } else {
      // response为null,表示网络出错,
      // onError()方法会在http.post()内调用.
      return false;
    }
  }
}
