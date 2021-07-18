import 'package:bookmacaroon_mobile/datas/global_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/login_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var loginModel = Provider.of<LoginModel>(context);
    int screenIndex = 0;
    List<Widget> screenList = [
      Text(
        '홈',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      Text(
        '게시판',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      Text(
        '알람',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      Text(
        '설정',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ];
    return Scaffold(
      /*
      body: Center(
        child: RaisedButton(
          child: Text('로그아웃'),
          onPressed: () => {
            loginModel.logout(
              () => {
                Navigator.pushNamed(context, '/login'),
              },
            ),
          },
        ),
      ),*/
      body: screenList[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: screenList[screenIndex],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.black,
            ),
            title: screenList[screenIndex],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm,
              color: Colors.black,
            ),
            title: screenList[screenIndex],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: screenList[screenIndex],
          ),
        ],
      ),
    );
  }
}
