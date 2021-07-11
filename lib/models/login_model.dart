import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../datas/login_data.dart';
import '../datas/global_data.dart';
import '../datas/consts.dart';

import '../screens/home_screen.dart';

/*
 * 로그인 처리 모델
 * @Provider : LoginModel
*/
enum LoginRequestCode {
  success,
  failed,
}

class LoginModel extends ChangeNotifier {
  LoginData loginData = LoginData();
  LoginRequestCode loginRequestCode;
  LoginModel() {
    isSigningIn = false;
  }

  bool _isDisposed = false; // 로딩 화면이 끝났는데 리스너호출하면 에러발생
  bool isLoading = true; // 로딩이 끝나기 전엔 true

  final googleSignIn = GoogleSignIn();
  bool isSigningIn;

  @override
  void dispose() {
    super.dispose();
    this._isDisposed = true;
  }

  void safetyNotifyListeners() {
    if (!this._isDisposed) {
      notifyListeners();
    }
  }

  Future getLoginData() async {
    // 로그인 데이터 가져오는 로직 수행 (autoLogin, id, password)
    // SharedPreference 에서 globalData 가져오기
    globalData.prefs = await SharedPreferences.getInstance();

    bool autoLogin;
    String snsType;
    try {
      autoLogin = globalData.prefs.getBool(Consts.autoLogin) ?? false;
      snsType = globalData.prefs.getString(Consts.snsType) ?? '';
    } catch (e) {
      autoLogin = false;
      snsType = '';
    }

    this.loginData.autoLogin = autoLogin;
    switch (snsType) {
      case 'SnsTypeEnum.google':
        this.loginData.snsType = SnsTypeEnum.google;
        break;
      // 현재는 구글만 지원
    }

    print('get login data ...');
    safetyNotifyListeners();
  }

  Future requestLogin() async {
    // login 요청
    switch (this.loginData.snsType) {
      case SnsTypeEnum.google:
        googleLogin();
        break;
      case SnsTypeEnum.apple:
      case SnsTypeEnum.kakao:
        break;
    }
    safetyNotifyListeners();
  }

  Future googleLogin() async {
    isSigningIn = true;
    final user = await googleSignIn.signIn();
    if (user == null) {
      this.isSigningIn = false;
      this.loginRequestCode = LoginRequestCode.failed;
      print('##### user login cancel');
    } else {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      FirebaseAuth auth = FirebaseAuth.instance;

      if (auth.currentUser != null) {
        this.isSigningIn = false;
        this.loginData.snsType = SnsTypeEnum.google;
        this.loginData.id = auth.currentUser.email;
        this.loginRequestCode = LoginRequestCode.success;
        saveLoginData(loginData);
      }
    }
    this.isLoading = false;
    safetyNotifyListeners();
  }

  void logout(Function callback) async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

  Future saveLoginData(LoginData loginData) async {
    globalData.prefs.setString(
      Consts.snsType,
      SnsTypeEnum.google.toString(),
    );
    globalData.prefs.setBool(
      Consts.autoLogin,
      true,
    );
    safetyNotifyListeners();
  }

  void homeScreenChange(
    BuildContext context,
  ) {
    print('로그인 성공 이후 홈스크린 출력');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
        settings: RouteSettings(name: '/home'),
      ),
    );
  }
}
