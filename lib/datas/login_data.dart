class LoginData {
  String id;
  SnsTypeEnum snsType;
  String password;
  bool autoLogin;

  LoginData({this.id, this.password, this.autoLogin, this.snsType});
}

enum SnsTypeEnum {
  kakao,
  google,
  apple,
}
