import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class YToast{
  static showText(String msg){
    _showText(msg);
  }
  static void _showText(String msg){
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Color(0xFF028A81),
      textColor: Colors.white,
    );
  }
}