import 'dart:io';

import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Text(
          '我的',
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
