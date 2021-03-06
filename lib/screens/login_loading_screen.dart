import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../models/login_model.dart';

import '../screens/login_screen.dart';
import '../screens/home_screen.dart';

class LoginLoadingScreen extends StatefulWidget {
  @override
  _LoginLoadingScreenState createState() => _LoginLoadingScreenState();
}

class _LoginLoadingScreenState extends State<LoginLoadingScreen> {
  bool initialize = false;
  @override
  void initState() {
    initialize = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var loginModel = Provider.of<LoginModel>(context);

    if (initialize) {
      initialize = false;
      getLoginDataTask(loginModel);
    }

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
            'resources/lottie/46472-lurking-cat.json',
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

  Future getLoginDataTask(LoginModel loginModel) async {
    await loginModel.getLoginData();

    if (loginModel.loginData.autoLogin) {
      await loginModel.requestLogin();
      loginResultTask(loginModel);
    } else
      changeLoginScreen();
  }

  void loginResultTask(LoginModel loginModel) {
    // login 결과값. 인증 성공일때에는 home 아니면 loginScreen으로 변경
    switch (loginModel.loginRequestCode) {
      case LoginRequestCode.success:
        loginModel.homeScreenChange(
          context,
        );
        break;
      case LoginRequestCode.failed:
        changeLoginScreen();
        break;
    }
  }

  void changeLoginScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
        settings: RouteSettings(name: '/login'),
      ),
    );
  }
}
