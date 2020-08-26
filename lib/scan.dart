import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermanager/common/common.dart';
import 'package:fluttermanager/widget/ItemView.dart';

// ignore: must_be_immutable
class ScanPage extends StatefulWidget {
  String meterNum;

  ScanPage({@required this.meterNum});

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "电表详情",
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
        body: Container(
          constraints: BoxConstraints.expand(), //全屏
          color: Color(0xfff8f8f8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('电表条码',
                          style: TextStyle(
                              color: Color(0xff999999), fontSize: 14)),
                      SizedBox(
                        height: 8,
                      ),
                      Text(widget.meterNum,
                          style:
                              TextStyle(color: Color(0xff333333), fontSize: 21))
                    ],
                  ),
                ),
                Divider(
                  height: 1.0,
                  indent: 15,//起点缩进距离
                  color: Color(0xffe6e6e6),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('检查时间',
                          style: TextStyle(
                              color: Color(0xff999999), fontSize: 14)),
                      SizedBox(
                        height: 8,
                      ),
                      Text(DateUtil.formatDate(DateUtil.getDateTimeByMs(getLogin().lastModifyTime),format: "yyyy年MM月dd日 HH:mm:ss"),
                          style:
                              TextStyle(color: Color(0xff333333), fontSize: 21))
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemView(lable: '户名',value: getLogin().realName,),
                      Divider(
                        height: 1.0,
                        indent: 15,//起点缩进距离
                        color: Color(0xffe6e6e6),
                      ),
                      ItemView(lable: '电话',value: getLogin().userPhone,),
                      Divider(
                        height: 1.0,
                        indent: 15,//起点缩进距离
                        color: Color(0xffe6e6e6),
                      ),
                      ItemView(lable: '地址',value: getLogin().region,),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('经纬度',style: TextStyle(color: Color(0xff999999),fontSize: 15)),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text('323,233',style: TextStyle(color: Color(0xff333333),fontSize: 15)),
                            )
                          ],
                        ),
                      ),
                      Image.asset('images/icon_position.png',width: 20,)
                    ],
                  ),
                ),
//                Container(//地图
//                  width: double.infinity,
//                  height: 120,
//                  child: Text('地图'),
//                )

              ],
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
