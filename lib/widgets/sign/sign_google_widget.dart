import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../models/login_model.dart';

class SignGoogleWidget extends StatefulWidget {
  @override
  _SignGoogleWidgetState createState() => _SignGoogleWidgetState();
}

class _SignGoogleWidgetState extends State<SignGoogleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                FontAwesomeIcons.google,
                color: Colors.red,
                size: 24,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: Text(
                'Sign In With Google',
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
        textColor: Colors.black,
        onPressed: () {
          callGoogleLogin();
        },
      ),
    );
  }

  void callGoogleLogin() async {
    final provider = Provider.of<LoginModel>(context, listen: false);
    await provider.googleLogin();

    switch (provider.loginRequestCode) {
      case LoginRequestCode.success:
        provider.homeScreenChange(context);
        break;
      case LoginRequestCode.failed:
        break;
    }
  }
}
