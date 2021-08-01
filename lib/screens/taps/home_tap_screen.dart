import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom/search_custom_widget.dart';

class HomeTapScreen extends StatefulWidget {
  @override
  _HomeTapScreenState createState() => _HomeTapScreenState();
}

class _HomeTapScreenState extends State<HomeTapScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchCustomWidget(
            textEditingController: controller,
            lPadding: 30,
            rPadding: 30,
            tPadding: 37,
          ),
        ],
      ),
    );
  }
}
