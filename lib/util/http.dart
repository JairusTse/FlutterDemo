
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_framework/constants/constants.dart';

/// HTTP请求工具类
class Http {

  /// 公开同步单例访问点
  factory Http() => _sharedInstance();

  /// 公开静态单例访问点
  static get instance => _sharedInstance();

  /// 私有静态实例成员,未初始化
  static Http _instance;

  /// 同步/静态单例访问点
  static Http _sharedInstance() {
    if (_instance == null) {
      _instance = Http._();
    }
    return _instance;
  }

  /// Dio实例
  Dio dio;

  /// 私有构造函数
  Http._() {
    dio = new Dio(BaseOptions(
      method: "POST",
      connectTimeout: 5000,
      receiveTimeout: 15000,
      contentType: ContentType.json,
      responseType: ResponseType.json,
    ));

//    dio.options.headers["Authorization"] = "这里可以设置登录后的token到headers";

    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      // 请求被发送之前
      // 如果你想完成请求并返回一些自定义数据,可以返回一个`Response`对象
      // 或返回`dio.resolve(data)`,这样请求将会被终止.
      // 上层then会被调用,then中返回的数据将是你的自定义数据data.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,
      // 或返回`dio.reject(errMsg)`,这样请求将被中止并触发异常,上层catchError会被调用.
      onRequest: (RequestOptions options) {
        print("\n================== 请求数据 ==========================");
        print("url = ${options.uri.toString()}");
        print("headers = ${options.headers}");
        print("params = ${options.data}");
        print("\n=====================================================");

        return options; //continue
      },
      // 返回响应数据之前
      onResponse: (Response response) {
        print("\n================== 响应数据 ==========================");
        print("code = ${response.statusCode}");
        print("data = ${response.data}");
        print("\n=====================================================");
        return response; // continue
      },
      // 请求失败之前
      onError: (DioError e) {
        print("\n================== 错误响应数据 ======================");
        print("type = ${e.type}");
        print("message = ${e.message}");
        print("\n=====================================================");
        return e; // continue
      },
    ));
  }

  /// POST请求
  Future<Map<String, dynamic>> post(
      {@required String url,
        @required Map params,
        @required onError(int code, String message)}) =>
      _request(url: url, data: params, onError: onError);

  /// GET请求
  Future<Map<String, dynamic>> get(
      {@required String url,
        Map params,
        @required onError(int code, String message)}) =>
      _request(
          url: url, queryParameters: params, onError: onError);

  /// 通用请求
  Future<Map<String, dynamic>> _request(
      {@required String url,
        Map data = const {},
        Map queryParameters,
        Options options,
        @required onError(int code, String message)}) async {
    Response<Map<String, dynamic>> response;
    try {
      response = await dio.request(url,
          data: data, queryParameters: queryParameters, options: options);
      return response.data;
    } catch (e) {
      //网络异常
      onError(Constants.codeNetError, e.toString());
      return null;
    }
  }
}