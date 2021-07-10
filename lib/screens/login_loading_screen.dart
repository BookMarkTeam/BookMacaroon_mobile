import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../models/login_model.dart';

class LoginLoadingScreen extends StatefulWidget {
  @override
  _LoginLoadingScreenState createState() => _LoginLoadingScreenState();
}

class _LoginLoadingScreenState extends State<LoginLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    var loginModel = Provider.of<LoginModel>(context);
    String loginStatusMessage = '';

    if (loginModel.isLoading) loginStatusMessage = '로그인 중입니다...';

    print('loading lottie start');
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Lottie.asset(
            'resources/lottie/67630-consultoria-telematica.json',
            animate: true,
            height: 300,
            width: 300,
          ),
          Spacer(),
          Text(loginStatusMessage),
          SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
