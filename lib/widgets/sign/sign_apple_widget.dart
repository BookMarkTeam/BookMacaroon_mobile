import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../models/login_model.dart';

class SignAppleWidget extends StatefulWidget {
  @override
  _SignAppleWidgetState createState() => _SignAppleWidgetState();
}

class _SignAppleWidgetState extends State<SignAppleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      width: 270,
      child: OutlineButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              child: FaIcon(
                FontAwesomeIcons.apple,
                color: Colors.white,
                size: 24,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: Text(
                'Sign In With Apple',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        highlightColor: Colors.black,
        borderSide: BorderSide(
          width: 0.2,
          color: Colors.black,
        ),
        textColor: Colors.white,
        onPressed: () {
          callAppleLogin();
        },
      ),
    );
  }

  void callAppleLogin() async {}
}
