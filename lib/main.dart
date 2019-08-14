import 'package:flutter/material.dart';
import 'page/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //去除右上角的Debug标签
      debugShowCheckedModeBanner: false,
      home: new SplashPage(), //启动页
    );
  }
}
