import 'dart:io';

/**
 * Copyright (c) 2018. 广州一企问信息科技有限公司 Inc. All rights reserved.
 * 作者：Created by WZS on 2019/8/8.
 * 联系方式：318805636@qq.com
 * 功能描述：
 * 修改：无
 */
import 'package:flutter/material.dart';

import '../splash_page.dart';

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
