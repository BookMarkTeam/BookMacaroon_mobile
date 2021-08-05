import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom/search_custom_widget.dart';
import '../../models/login_model.dart';
import '../../models/taps/home_tap_model.dart';

class HomeTapScreen extends StatefulWidget {
  @override
  _HomeTapScreenState createState() => _HomeTapScreenState();
}

class _HomeTapScreenState extends State<HomeTapScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var loginModel = Provider.of<LoginModel>(context);
    var homeTapModel = Provider.of<HomeTapModel>(context);
    return Scaffold(
      body: Column(
        children: [
          SearchCustomWidget(
            textEditingController: controller,
            lPadding: 30,
            rPadding: 30,
            tPadding: 37,
          ),
          Container(
            height: 43,
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            margin: EdgeInsets.fromLTRB(0, 17, 0, 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.0),
                      color: Color(0x40E5E5E5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            color: !homeTapModel.listStyle
                                ? Color(0x406C7BFF)
                                : null,
                            child: Text("폴더"),
                            onPressed: () => {
                              if (homeTapModel.listStyle)
                                homeTapModel.changeListStyle()
                            },
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            color: homeTapModel.listStyle
                                ? Color(0x406C7BFF)
                                : null,
                            child: Text("목록"),
                            onPressed: () => {
                              if (!homeTapModel.listStyle)
                                homeTapModel.changeListStyle()
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.view_list),
                  splashRadius: 16.0, // 버튼 클릭시 클릭 모션 화면번짐 크기
                  onPressed: () => {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
