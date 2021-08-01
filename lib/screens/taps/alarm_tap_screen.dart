import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlarmTapScreen extends StatefulWidget {
  @override
  _AlarmTapScreenState createState() => _AlarmTapScreenState();
}

class _AlarmTapScreenState extends State<AlarmTapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("알람 화면"),
    );
  }
}
