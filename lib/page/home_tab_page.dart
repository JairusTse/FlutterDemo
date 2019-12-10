import 'package:bottom_tab_bar/bottom_tab_bar_item.dart';
import 'package:bottom_tab_bar/bottom_tab_bar_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_framework/widget/bottom_badge_bar.dart';
import 'package:flutter_framework/widget/bottom_badge_bar_item.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_page.dart';
import 'list_page.dart';
import 'mine/mine_page.dart';
import 'recommend_page.dart';

// 应用页面使用有状态Widget
class HomeTabPage extends StatefulWidget {
  @override
  HomeTabPageState createState() => HomeTabPageState();
}

class HomeTabPageState extends State<HomeTabPage>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  final List<Image> _tabImages = [
    Image.asset('assets/images/icon_tab_home_normal.png',
        width: 25, height: 25),
    Image.asset('assets/images/icon_tab_home_press.png', width: 25, height: 25),
    Image.asset('assets/images/icon_tab_mine_normal.png',
        width: 25, height: 25),
    Image.asset('assets/images/icon_tab_home_press.png', width: 25, height: 25),
    Image.asset('assets/images/icon_tab_mine_normal.png',
        width: 25, height: 25),
    Image.asset('assets/images/icon_tab_home_press.png', width: 25, height: 25),
    Image.asset('assets/images/icon_tab_mine_normal.png',
        width: 25, height: 25),
    Image.asset('assets/images/icon_tab_mine_press.png', width: 25, height: 25),
  ];

  int _selectedIndex = 1;
  int badgeNo; //未读数
  var titles = ['home', 'video', 'find', 'smallvideo', 'my'];
  var icons = [
    Icons.home,
    Icons.play_arrow,
    Icons.child_friendly,
    Icons.fiber_new,
    Icons.mic_none
  ];

  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Video'),
    Text('Index 2: find someone'),
    Text('Index 3: small Video'),
    Text('Index 4: My'),
  ];

  @override
  void initState() {
    badgeNo = 12;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: IndexedStack(
        children: <Widget>[
          HomePage(),
          ListPage(),
          RecommendPage(),
          MinePage(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: BottomBadgeBar(
        items: [
          BottomBadgeBarItem(
            icon: _getHomeImage(0),
            title: Text("首页"),
            badgeCount: 10,
            badge: _buildBadge(badgeNo),
            padding: EdgeInsets.only(left:40),
          ),
          BottomBadgeBarItem(
            icon: _getListImage(1),
            title: Text("列表"),
            badgeCount: 5,
            badge: _buildBadge(badgeNo),
            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
          ),
          BottomBadgeBarItem(
            icon: _getRecommendImage(2),
            title: Text("我的"),
            badgeCount: 3,
            badge: _buildBadge(badgeNo),
          ),
//          BottomBadgeBarItem(
//            icon: _getMineImage(3),
//            title: Text("我的"),
//            badgeCount: 4,
//            badge: _buildBadge(badgeNo),
//          ),
        ],
        currentIndex: _tabIndex,
        backgroundColor: Color(0xFFFFFFFF),
//        activeColor: Color(0xFF0041C4),
        unselectedItemColor: Color(0xFF818181),
        selectedItemColor: Color(0xFF0041C4),
        type: BottomBadgeBarType.fixed,
        unselectedFontSize: 14,
        onTap: (index) {
          setState(() {
            _tabIndex = index;

            if(badgeNo < 100) {
              badgeNo++;
            } else {
              badgeNo = 0;
            }
          });
        },
      ),


//      bottomNavigationBar: BottomNavigationBar(
//        items: [
//          BottomNavigationBarItem(
//            icon: _getHomeImage(0),
//            title: Text("首页"),
//          ),
//          BottomNavigationBarItem(
//            icon: _getListImage(1),
//            title: Text("列表"),
//          ),
//          BottomNavigationBarItem(
//            icon: _getRecommendImage(2),
//            title: Text("推荐"),
//          ),
//          BottomNavigationBarItem(
//            icon: _getMineImage(3),
//            title: Text("我的"),
//          ),
//        ],
//        currentIndex: _tabIndex,
//        backgroundColor: Color(0xFFFFFFFF),
////        activeColor: Color(0xFF0041C4),
//        unselectedItemColor: Color(0xFF818181),
//        selectedItemColor: Color(0xFF0041C4),
//        type: BottomNavigationBarType.fixed,
//        unselectedFontSize: 14,
//        onTap: (index) {
//          setState(() {
//            _tabIndex = index;
//          });
//        },
//      ),

      //=========================================================================

//        floatingActionButton: FloatingActionButton( //悬浮按钮
//            child: Icon(Icons.add),
//            onPressed: () {
//              Fluttertoast.showToast(msg: "点击了");
//            }
//        ),
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//        bottomNavigationBar: BottomAppBar(
//          color: Colors.white,
//          shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
//          child: Row(
//            children: [
//              IconButton(icon: Icon(Icons.home)),
//              SizedBox(), //中间位置空出
//              IconButton(icon: Icon(Icons.business)),
//            ],
//            mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
//          ),
//        )

      //=========================================================================

//      bottomNavigationBar: BottomTabBar(
//        items: <BottomTabBarItem>[
//          BottomTabBarItem(
//              icon: Icon(icons[0]), title: Text(titles[0]), badge:
//    _buildBadge(badgeNo1)),
//          BottomTabBarItem(icon: Icon(icons[1]), title: Text(titles[1]), badge:
//          _buildBadge("1")),
//          BottomTabBarItem(icon: Icon(icons[2]), title: Text(titles[2]),
//              badge:
//              _buildBadge("1")),
//          BottomTabBarItem(
//              icon: Icon(icons[3]),
//              activeIcon: Icon(icons[3]),
//              title: Text(titles[3]), badge:
//          _buildBadge("1")),
//          BottomTabBarItem(icon: Icon(icons[4]), title: Text(titles[4]),
//              badge:
//              _buildBadge("1")),
//        ],
//        fixedColor: Colors.blue,
//        currentIndex: _selectedIndex,
//        onTap: _onItemSelected,
//        type: BottomTabBarType.fixed,
//        isAnimation: false,
//        isInkResponse: false,
//        badgeColor: Colors.green,
//      ),
    );
  }

  Image _getHomeImage(int index) {
    if (_tabIndex == index) {
      return _tabImages[1];
    } else {
      return _tabImages[0];
    }
  }

  Image _getListImage(int index) {
    if (_tabIndex == index) {
      return _tabImages[3];
    } else {
      return _tabImages[2];
    }
  }

  Image _getRecommendImage(int index) {
    if (_tabIndex == index) {
      return _tabImages[5];
    } else {
      return _tabImages[4];
    }
  }

  Image _getMineImage(int index) {
    if (_tabIndex == index) {
      return _tabImages[7];
    } else {
      return _tabImages[6];
    }
  }

  Widget _buildBadge(int badgeNo) {
    if (badgeNo == null || badgeNo <= 0) {
      return Container();
    }

    String badgeStr = "";
    if(badgeNo < 100) {
      badgeStr = badgeNo.toString();
    } else {
      badgeStr = "99+";
    }

    return Container(
      width: 24,
      padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0XFFEE1515),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Text(
        badgeStr,
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
    );
  }
}
