import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewNoDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/img_null.png', width: 96),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text('暂无相关数据',style: TextStyle(fontSize: 14,color: Color(0xff999999),),textAlign: TextAlign.center),
            )
          ],
        )
    );
  }

}
