//
// Created with Android Studio.
// Created by zcp.
// Date: 2019/9/6
// Time: 10:28
// email: zdebug@foxmail.com
//

import 'package:flutter/material.dart';

/// 带居中圆形进度条的父布局
class ProgressDialog extends StatelessWidget {
  /// 子布局
  final Widget child;

  /// 加载中是否显示
  final bool loading;

  /// 进度提醒内容
  final String msg;

  /// 加载中动画
  final Widget progress;

  /// 背景透明度
  final double alpha;

  /// 字体颜色
  final Color textColor;

  ProgressDialog({
    Key key,
    @required this.loading,
    this.msg,
    this.progress = const CircularProgressIndicator(),
    this.alpha = 0.6,
    this.textColor = Colors.white,
    @required this.child
  }) : assert(child != null),
       assert(loading != null),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (loading) {
      Widget layoutProgress;
      if (msg == null) {
        layoutProgress = Center(
          child: progress,
        );
      } else {
        layoutProgress = Center(
          child: Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(4.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                progress,
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    msg,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16.0,
                      decoration: TextDecoration.none
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
      widgetList.add(
        Opacity(
          opacity: alpha,
          child: WillPopScope(
            onWillPop: () async => false,
            child: ModalBarrier(
              color: Colors.black87,
              dismissible: false
            )
          ),
        )
      );
      widgetList.add(layoutProgress);
    }
    return Stack(
      children: widgetList,
    );
  }
}