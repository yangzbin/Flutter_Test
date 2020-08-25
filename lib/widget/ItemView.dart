//自定义组件
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  ItemView({@required this.lable, @required this.value, this.textSize = 15,this.top=15,this.width,this.onPressed});

  final String lable;
  final String value;
  final double textSize;
  final double top;
  final double width;

  //点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: top,left: 15,right: 15,bottom: 15),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width,
            margin: EdgeInsets.only(right:10),
            child: Text(
              lable,
              style: TextStyle(fontSize: textSize, color: Color(0xff999999)),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
           child: InkWell(
             child: Text(
               value,
               style: TextStyle(fontSize: textSize, color: Color(0xff333333)),
               textAlign: TextAlign.start,
             ),
             onTap: onPressed,
           ),
          )
        ],
      ),
    );
  }
}
