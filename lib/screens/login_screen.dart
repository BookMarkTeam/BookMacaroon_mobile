import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/home_screen.dart';

import '../datas/login_data.dart';

import '../models/login_model.dart';

import '../widgets/sign/sign_google_widget.dart';

class LoginScreen extends StatefulWidget {
  final LoginData loginData;
  LoginScreen({this.loginData});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var loginModel = Provider.of<LoginModel>(context);

    print(loginModel.loginData.id);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Text(
              'Book Macaroon',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            SignGoogleWidget(
              loginSuccessFunc: changeHomeScreen,
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  void changeHomeScreen() {
    print('로그인 성공 이후 홈스크린 출력');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
        settings: RouteSettings(name: '/home'),
      ),
    );
  }
}
