import 'package:flutter/foundation.dart';

/*
 * 로그인 처리 모델
 * @Provider : LoginModel
*/
class LoginModel extends ChangeNotifier {
  LoginModel() {}

  bool isLoading = true; // 로딩이 끝나기 전엔 true
}
