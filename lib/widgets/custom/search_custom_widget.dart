import 'package:flutter/material.dart';

class SearchCustomWidget extends StatefulWidget {
  final double lPadding;
  final double rPadding;
  final double tPadding;
  final double bPadding;
  final TextEditingController textEditingController;
  SearchCustomWidget({
    @required this.textEditingController,
    this.lPadding = 1.0,
    this.bPadding = 1.0,
    this.rPadding = 1.0,
    this.tPadding = 1.0,
  });

  @override
  _SearchCustomWidgetState createState() => _SearchCustomWidgetState();
}

class _SearchCustomWidgetState extends State<SearchCustomWidget> {
  bool isEditTexting = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        widget.lPadding,
        widget.tPadding,
        widget.rPadding,
        widget.bPadding,
      ),
      child: TextFormField(
        controller: widget.textEditingController,
        autofocus: false,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: isEditTexting
                ? IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.black,
                    ),
                    splashRadius: 1.0, // 버튼 클릭시 클릭 모션 화면번짐 크기
                    onPressed: () {
                      setState(() {
                        widget.textEditingController.clear();
                        isEditTexting = false;
                      });
                    },
                  )
                : IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    splashRadius: 0.1,
                    onPressed: () {},
                  ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(
              color: Color(0xffe0e0e0),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(
              color: Color(0xff616161),
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        onChanged: (value) => {
          if (value.length > 1)
            {
              setState(
                () {
                  isEditTexting = true;
                },
              ),
            },
        },
      ),
    );
  }
}
