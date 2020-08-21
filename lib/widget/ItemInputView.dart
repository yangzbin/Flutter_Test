
import 'package:flutter/material.dart';

class ItemInputView extends StatelessWidget {
  ItemInputView(
      {@required this.lable, @required this.hint, @required this.inputType,@required this.controller,this.valueChanged});

  final String lable;
  final String hint;
  final TextInputType inputType;
  //输入
  final TextEditingController controller;
  final ValueChanged valueChanged;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 60,
            child: Text(
              lable,
              style: TextStyle(fontSize: 15, color: Color(0xff999999)),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: valueChanged,
              maxLines: 1,
              controller: controller,
              decoration: InputDecoration(
                  hintText: hint,
                  contentPadding: const EdgeInsets.symmetric(vertical: 7),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xffbbbbbb)
                  )
              ),
              keyboardType: inputType,
              style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 15
              ),
            ),
          )
        ],
      ),
    );
  }
}