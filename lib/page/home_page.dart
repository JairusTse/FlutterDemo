import 'package:flutter/material.dart';
import 'package:flutter_framework/util/request.dart';
import 'package:fluttertoast/fluttertoast.dart';

// 应用页面使用有状态Widget
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              '首页',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.red[500],
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              child: Text("获取数据"),
              onPressed: () {
                Request.getMessage(
                    tag: "__all__",
                    page: 0,
                    onError: (code, message) {
                      //请求失败
                      Fluttertoast.showToast(
                          msg: code.toString() + "：" + message,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }).then((message) {
                  Fluttertoast.showToast(
                      msg: message.data[0].xAbstract,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
