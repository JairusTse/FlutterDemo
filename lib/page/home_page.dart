import 'package:flutter/material.dart';

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
        child: new Text(
          '首页',
          textAlign: TextAlign.center,
          style: new TextStyle(
              color: Colors.red[500],
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
