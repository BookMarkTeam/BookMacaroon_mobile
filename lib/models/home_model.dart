import 'package:flutter/cupertino.dart';

import '../datas/home_bottom_navigators.dart';

class HomeModel extends ChangeNotifier {
  HomeBottomNavigators homeBottomNavigators = HomeBottomNavigators.home;

  changeHomeBottomTapScreen(HomeBottomNavigators bottomNavigators) {
    homeBottomNavigators = bottomNavigators;
    notifyListeners();
  }
}
