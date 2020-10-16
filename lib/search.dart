import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttermanager/httpUtil/DioManager.dart';
import 'package:fluttermanager/models/meter_list_entity.dart';
import 'package:fluttermanager/toastUtil/YToast.dart';
import 'package:fluttermanager/widget/ItemView.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'httpUtil/NWApi.dart';
import 'httpUtil/NWMethod.dart';

//数据源
final List<Meter> meters = new List();

class SearchPage extends StatefulWidget {
  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMeterList("1");
  }

  //获取网络数据
  void getMeterList(String value) {
    Map<String, dynamic> paramsMap = new Map();
    paramsMap['queryCriteria'] = value;
    DioManager().request<MeterListEntity>(NWMethod.POST, NWApi.meterList,
        params: paramsMap, success: (data) {
          setState(() {
            //刷新页面
            meters.clear();
            meters.addAll(data.list);
          });
          //print(meters.toString());
        }, error: (error) {
          print("error code = ${error.errorCode}, massage = ${error.message}");
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索", style: TextStyle(color: Colors.white, fontSize: 17)),
        centerTitle: true,
      ),
      body:Column(
        children: [
          Container(
            height: 44,
            color: Colors.white,
            padding:
            EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17), //圆角
                  color: Color(0xffe9e9e9),
                ),
//                      padding: EdgeInsets.only(left: 17.5),
                child: TextField(
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: '搜索姓名或关键字',
                      hintStyle: TextStyle(
                          color: Color(0xffaaaaaa), fontSize: 14),
                      prefixIcon: Padding(
                        //设置图标文字间隔
                        padding: EdgeInsets.only(left: 17.5, right: 12.5),
                        child: Image.asset("images/home_icon_search.png",
                            width: 14.93),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 14.93,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 12)),
                  keyboardType: TextInputType.text,
                  style:
                  TextStyle(color: Color(0xff333333), fontSize: 15),
                  onChanged: (value) {
                    //搜索
                    getMeterList(value);
                  },
                )),
          ),
          Expanded(//expande就是listview有多大就有多大,container就是container多大listview就有多大，可以滚动
             child: Container(
               margin: EdgeInsets.only(top: 5),
               child: childWidget()
             ),
          )
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
// 相当于itemView
//使用GestureDetector 手势检测器 可以给 widget添加点击事件
Widget _cellForRow(Meter meter) {
  return GestureDetector(
    onTap: (){
     YToast.showText(meter.accountName);
    },
    child: Container(
      margin: EdgeInsets.only(top: 10), // 上间距
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //Column 上下布局  Row 横向布局  Stack 层级布局
        //上下布局
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15,bottom: 10),
            child: Text(
              meter.accountName,
              style: TextStyle(fontSize: 16, color: Color(0xff333333)),
              textAlign: TextAlign.start,
            ),
          ),
          ItemView(
            lable: '电表条码：',
            value: meter.meterNumber,
            textSize: 14,
            top: 0,
          ),
          ItemView(
            lable: '电话：',
            value: meter.accountPhone,
            textSize: 14,
            top: 0,
          ),
          ItemView(
            lable: '地址：',
            value: meter.accountAddress,
            textSize: 14,
            top: 0,
          ),
        ],
      ),
    ),
  );
}
//主页面
Widget childWidget() {
  Widget childWidget;
  if (meters != null && meters.length != 0) {
    childWidget = new ListView.builder(
      itemCount: meters.length,
      itemBuilder: (context, pos) {
        return _cellForRow(meters[pos]);
      },
    );
  } else {
    childWidget = new Stack(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 35.0),
          child: new Center(
            child: SpinKitFadingCircle(
              color: Colors.blueAccent,
              size: 30.0,
            ),
          ),
        ),
        new Padding(
          padding: new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
          child: new Center(
            child: new Text('正在加载中，莫着急哦~'),
          ),
        ),
      ],
    );
  }
  return childWidget;
}