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
      padding: EdgeInsets.all(4),
      child: OutlineButton.icon(
        label: Text(
          'Sign In With Google',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        highlightColor: Colors.black,
        borderSide: BorderSide(color: Colors.black),
        textColor: Colors.black,
        icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
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
