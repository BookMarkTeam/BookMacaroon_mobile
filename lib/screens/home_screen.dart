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
    return Scaffold(
      body: Center(
        child: Text(loginModel.loginData.id),
      ),
    );
  }
}
