import 'package:flutter/material.dart';

import '../../datas/global_data.dart';
import '../../datas/consts.dart';

class HomeTapModel extends ChangeNotifier {
  bool listStyle = false;

  HomeTapModel() {
    bool style = globalData.prefs.getBool(Consts.bookmarkListStyle) ?? false;
    // 목록형 스타일로 설정되어있을 경우에,
    listStyle = style;
  }

  void changeListStyle() {
    listStyle = !listStyle;
    notifyListeners();

    // todo :: 폴더가 많을수록 전환하는데 오래 걸릴수도 있음.
    // 이 문제는 비동기로 해결하고 전환되는 동안은 로딩화면이 보여져야됨.
    globalData.prefs.setBool(Consts.bookmarkListStyle, listStyle);
  }
}
