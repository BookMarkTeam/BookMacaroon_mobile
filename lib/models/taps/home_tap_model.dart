import 'dart:convert';

import 'package:flutter/material.dart';

import '../../datas/global_data.dart';
import '../../datas/consts.dart';

class HomeTapModel extends ChangeNotifier {
  bool listStyle = false;
  var path = new List(); // folder명으로 되어있는 경로가 들어가게된다
  var bookmarkElement = new List();
  var directoryElement = new List();
  var elements = new List();
  var data; // 얘가 json 으로 되어있는애 실질적으로 얘는 통신하면서 datas로 바뀌어야될것
  Map<String, dynamic> datas; // 얘가 json 을 푼놈 , 변하면안되고 계속 갖고있어야되는 데이터

  HomeTapModel({@required this.data}) {
    bool style = globalData.prefs.getBool(Consts.bookmarkListStyle) ?? false;
    // 목록형 스타일로 설정되어있을 경우에,
    listStyle = style;

    //임시 데이터 추가
    data = {
      "result": true,
      "name": "홈",
      "type": "root",
      "children": [
        {"name": "북마크1", "type": "bookmark"},
        {"name": "북마크2", "type": "bookmark"},
        {"name": "북마크3", "type": "bookmark"},
        {"name": "북마크4", "type": "bookmark"},
        {
          "name": "자식북마크폴더",
          "type": "directory",
          "children": [
            {
              "name": "자식북마크폴더2",
              "type": "directory",
              "children": [
                {"name": "자식의자식북마크1", "type": "bookmark"},
                {"name": "자식의자식북마크2", "type": "bookmark"},
                {"name": "자식의자식북마크3", "type": "bookmark"}
              ]
            },
            {
              "name": "자식3",
              "type": "directory",
              "children": [
                {"name": "자식31", "type": "bookmark"},
                {"name": "자식32", "type": "bookmark"},
                {"name": "자식33", "type": "bookmark"},
                {
                  "name": "자식4",
                  "type": "directory",
                  "children": [
                    {"name": "자식41", "type": "bookmark"},
                    {"name": "자식42", "type": "bookmark"},
                    {"name": "자식43", "type": "bookmark"}
                  ]
                }
              ]
            },
            {"name": "자식북마크1", "type": "bookmark"},
            {"name": "자식북마크2", "type": "bookmark"},
            {"name": "자식북마크3", "type": "bookmark"}
          ]
        }
      ]
    };
    String decode = jsonEncode(data);
    dynamic json = jsonDecode(decode);
    datas = json;
    getFileFolderRoot();
  }

  void changeListStyle() {
    listStyle = !listStyle;
    notifyListeners();

    // todo :: 폴더가 많을수록 전환하는데 오래 걸릴수도 있음 (폴더목록을 새로 가져오는게 아니라서 아닐수도 ?)
    // 이 문제는 비동기로 해결하고 전환되는 동안은 로딩화면이 보여져야됨.
    globalData.prefs.setBool(Consts.bookmarkListStyle, listStyle);
  }

  void getFileFolderRoot() {
    folderClear();
    if (datas['type'] == 'root') {
      List<dynamic> children = datas['children'];
      elements = sortFileFolder(children);
    }
    initPath();
    notifyListeners();
  }

  void enterFolder(var element) {
    path.add(element['name']);
    folderClear();
    List<dynamic> children = element['children'];
    elements = sortFileFolder(children);

    notifyListeners();
  }

  List sortFileFolder(List<dynamic> children) {
    var sortChildren = new List();
    var bookmarkElement = new List();
    var directoryElement = new List();
    children.forEach((element) {
      if (element['type'] == 'bookmark')
        bookmarkElement.add(element);
      else if (element['type'] == 'directory') directoryElement.add(element);
    });
    sortChildren.addAll(directoryElement);
    sortChildren.addAll(bookmarkElement);
    return sortChildren;
  }

  void upperFolder() {
    path.removeLast();
    if (path.length == 1) {
      getFileFolderRoot();
      return;
    }
    folderClear();
    elements = sortFileFolder(enterPath(path));
    notifyListeners();
  }

  List enterPath(List<dynamic> enterPath) {
    var enterElements = new List();
    enterPath.asMap().forEach((index, value) {
      if (index > 0) {
        List<dynamic> children =
            enterElements.isEmpty == true ? datas['children'] : enterElements;
        for (var element in children) {
          if (element['type'] == 'directory') {
            if (element['name'] == value) {
              enterElements.clear();
              enterElements.addAll(element['children']);
              break;
            }
          }
        }
        // children.forEach((element) {
        //   if (element['type'] == 'directory') {
        //     if (element['name'] == value) {
        //       enterElements.clear();
        //       enterElements.addAll(element['children']);
        //     }
        //   }
        // });
      }
    });
    return enterElements;
  }

  void folderClear() {
    bookmarkElement.clear();
    directoryElement.clear();
    elements.clear();
  }

  bool isFolderType(String type) {
    if (type == 'directory' || type == 'root')
      return true;
    else
      return false;
  }

  void initPath() {
    path.clear();
    path.add('root');
  }
}
