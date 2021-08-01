import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/login_model.dart';

class SettingTapScreen extends StatefulWidget {
  @override
  _SettingTapScreenState createState() => _SettingTapScreenState();
}

class _SettingTapScreenState extends State<SettingTapScreen> {
  @override
  Widget build(BuildContext context) {
    var loginModel = Provider.of<LoginModel>(context);
    return Scaffold(
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
      ),
    );
  }
}
