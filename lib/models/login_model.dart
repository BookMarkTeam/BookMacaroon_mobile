import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../datas/login_data.dart';

/*
 * 로그인 처리 모델
 * @Provider : LoginModel
*/
class LoginModel extends ChangeNotifier {
  LoginData loginData = LoginData();
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
    if (!this._isDisposed) notifyListeners();
  }

  Future getLoginData() async {
    // 로그인 데이터 가져오는 로직 수행 (autoLogin, id, password)
    // SharedPreference 에서 globalData 가져오기
    this.loginData.autoLogin = false;
    this.loginData.id = 'test';
    print('get login data ...');

    // safetyNotifyListeners();
  }

  Future requestLogin() async {
    print('requestLogin');
    safetyNotifyListeners();
    // login 요청
  }

  Future login(Function callback) async {
    isSigningIn = true;
    final user = await googleSignIn.signIn();
    if (user == null) {
      isSigningIn = false;
      print('##### user login cancel');
      return;
    } else {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      FirebaseAuth auth = FirebaseAuth.instance;

      if (auth.currentUser != null) {
        print(auth.currentUser.email);
        callback();
      }
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
