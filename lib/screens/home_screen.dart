import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/login_model.dart';
import '../models/home_model.dart';
import '../models/taps/home_tap_model.dart';
import '../models/taps/bookmark_tap_model.dart';
import '../models/taps/alarm_tap_model.dart';
import '../models/taps/setting_tap_model.dart';

import '../screens/taps/home_tap_screen.dart';
import '../screens/taps/bookmark_tap_screen.dart';
import '../screens/taps/alarm_tap_screen.dart';
import '../screens/taps/setting_tap_screen.dart';

import '../datas/home_bottom_navigators.dart';
import '../datas/global_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var loginModel = Provider.of<LoginModel>(context);
    var homeModel = Provider.of<HomeModel>(context);
    Widget tapWidget;
    switch (homeModel.homeBottomNavigators) {
      case HomeBottomNavigators.home:
        tapWidget = ChangeNotifierProvider<HomeTapModel>(
          create: (context) => HomeTapModel(),
          child: HomeTapScreen(),
        );
        break;
      case HomeBottomNavigators.bookmark:
        tapWidget = ChangeNotifierProvider<BookmarkTapModel>(
          create: (context) => BookmarkTapModel(),
          child: BookmarkTapScreen(),
        );
        break;
      case HomeBottomNavigators.alarm:
        tapWidget = ChangeNotifierProvider<AlarmTapModel>(
          create: (context) => AlarmTapModel(),
          child: AlarmTapScreen(),
        );
        break;
      case HomeBottomNavigators.setting:
        tapWidget = ChangeNotifierProvider<SettingTapModel>(
          create: (context) => SettingTapModel(),
          child: SettingTapScreen(),
        );
        break;
    }
    return Scaffold(
      body: tapWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeModel.homeBottomNavigators.index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text(
              '홈',
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.black,
            ),
            title: Text(
              '게시판',
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm,
              color: Colors.black,
            ),
            title: Text(
              '알람',
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: Text(
              '설정',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        onTap: (int index) {
          homeModel
              .changeHomeBottomTapScreen(HomeBottomNavigators.values[index]);
        },
      ),
    );
  }
}
