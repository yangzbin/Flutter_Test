import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermanager/widget/ItemInputView.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PswordPage extends StatefulWidget {

  @override
  _pswordPageState createState() => _pswordPageState();
}

class _pswordPageState extends State<PswordPage> {
  bool canSubmit = false;
  String oldStr = '';
  String newStr = '';

  //旧密码
  TextEditingController oldPs;
  //新密码
  TextEditingController newPs;
  @override
  Widget build(BuildContext context) {
    void checkSubmit(){
      setState(() {
        if(oldStr.isNotEmpty && newStr.isNotEmpty){
          canSubmit = true;
        }else{
          canSubmit = false;
        }
      });
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('修改密码',style: TextStyle(color: Colors.white, fontSize: 17)),
          centerTitle: true,
        ),
        body: Container(
          constraints: BoxConstraints.expand(), //全屏
          color: Color(0xfff8f8f8),
          child: Container(
            margin: EdgeInsets.only(top: 12),
            child: Center(
              child: Column(
                children: [
                  ItemInputView(
                    lable: '旧密码',
                    hint: '请填写',
                    inputType: TextInputType.text,
                    controller: oldPs,
                    valueChanged: (value){
                      oldStr = value.toString();
                      checkSubmit();
                    },
                  ),
                  Divider(
                    height: 12,
                    indent: 15,
                    color: Color(0xfff8f8f8),
                  ),
                  ItemInputView(
                    lable: '新密码',
                    hint: '请填写',
                    inputType: TextInputType.text,
                    controller: newPs,
                    valueChanged: (value){
                      newStr = value.toString();
                      checkSubmit();
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 120),
                    width: double.infinity,//宽度全屏
                    height: 47,
                    padding: EdgeInsets.only(left: 28,right: 28),
                    child:  RaisedButton(
                      onPressed: canSubmit?(){
                        Fluttertoast.showToast(
                          msg: "提交",
                          backgroundColor: Color(0xFF028A81),
                          textColor: Colors.white,
                        );
                      }:null,
                      textColor: Colors.white,
                      disabledTextColor: Color(0xffbbbbbb),
                      color: Color(0xff028a81),
                      disabledColor: Color(0xffdddddd),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("提交",style: TextStyle(fontSize: 18)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}