import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'mine/mine_page.dart';

// 应用页面使用有状态Widget
class HomeTabPage extends StatefulWidget {
  @override
  HomeTabPageState createState() => HomeTabPageState();
}

class HomeTabPageState extends State<HomeTabPage> {
  int _tabIndex = 0;
  final List<Image> _tabImages = [
    Image.asset('assets/images/icon_tab_home_normal.png',
        width: 25, height: 25),
    Image.asset('assets/images/icon_tab_home_press.png', width: 25, height: 25),
    Image.asset('assets/images/icon_tab_mine_normal.png',
        width: 25, height: 25),
    Image.asset('assets/images/icon_tab_mine_press.png', width: 25, height: 25),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: IndexedStack(
        children: <Widget>[
          HomePage(),
          MinePage(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: _getBookshelfImage(0),
            title: Text("首页"),
          ),
          BottomNavigationBarItem(
            icon: _getHomeImage(1),
            title: Text("我的"),
          ),
        ],
        currentIndex: _tabIndex,
        backgroundColor: Color(0xFFFFFFFF),
        activeColor: Color(0xFF0041C4),
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Image _getBookshelfImage(int index) {
    if (_tabIndex == index) {
      return _tabImages[1];
    } else {
      return _tabImages[0];
    }
  }

  Image _getHomeImage(int index) {
    if (_tabIndex == index) {
      return _tabImages[3];
    } else {
      return _tabImages[2];
    }
  }
}
