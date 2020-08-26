import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SelectPage extends StatefulWidget {
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  String startTime = '开始时间';
  bool chooseStart = false;
  String endTime = '结束时间';
  bool chooseEnd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "信息导出",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          //子组件沿着 Cross 轴（在 Row 中是纵轴）如何摆放，其实就是子组件对齐方式，可选值有：
          //CrossAxisAlignment.start：子组件在 Row 中顶部对齐
          //CrossAxisAlignment.end：子组件在 Row 中底部对齐
          //CrossAxisAlignment.center：子组件在 Row 中居中对齐
          //CrossAxisAlignment.stretch：拉伸填充满父布局
          //CrossAxisAlignment.baseline：在 Row 组件中会报错
          crossAxisAlignment: CrossAxisAlignment.start,
          //子组件沿着 Main 轴（在 Row 中是横轴）如何摆放，其实就是子组件排列方式，可选值有：
          //MainAxisAlignment.start：靠左排列
          //MainAxisAlignment.end：靠右排列
          //MainAxisAlignment.center：居中排列
          //MainAxisAlignment.spaceAround：每个子组件左右间隔相等，也就是 margin 相等
          //MainAxisAlignment.spaceBetween：两端对齐，也就是第一个子组件靠左，最后一个子组件靠右，剩余组件在中间平均分散排列
          //MainAxisAlignment.spaceEvenly：每个子组件平均分散排列，也就是宽度相等
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //Main 轴大小，可选值有：
          //MainAxisSize.max：相当于 Android 的 match_parent
          //MainAxisSize.min：相当于 Android 的 wrap_content
          mainAxisSize: MainAxisSize.max,
          //不太理解
//            textBaseline: TextBaseline.alphabetic,
          //子组件排列顺序，可选值有：
          //TextDirection.ltr：从左往右开始排列
          //TextDirection.rtl：从右往左开始排列
          textDirection: TextDirection.ltr,
          //确定如何在垂直方向摆放子组件，以及如何解释 start 和 end，指定 height 可以看到效果，可选值有：
          //VerticalDirection.up：Row 从下至上开始摆放子组件，此时我们看到的底部其实是顶部
          //VerticalDirection.down：Row 从上至下开始摆放子组件，此时我们看到的顶部就是顶部
          verticalDirection: VerticalDirection.down,

          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 0, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('时间选择',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff333333))),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border:
                              Border.all(color: Color(0xff979797), width: 1)),
                      padding: EdgeInsets.only(
                          right: 10, top: 8, left: 10, bottom: 8),
                      child: Row(
                        children: [
                          Text('按日选择',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff333333))),
                          SizedBox(
                            width: 8,
                          ),
                          Image.asset(
                            'images/select_icon_retweet.png',
                            width: 14,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                chooseStart = true;
                                chooseEnd = false;
                              });
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
//                                  minTime: DateTime(2018, 3, 5),
//                                  maxTime: DateTime(2019, 6, 7),
                                  onChanged: (date) {
                                    print('change $date');
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                    setState(() {
                                      startTime = DateUtil.formatDate(date,format: DateFormats.y_mo_d);
                                    });
                                  }, currentTime: DateTime.now(), locale: LocaleType.zh);
                            },
                            child: Text(startTime,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: chooseStart==true?Color(0xff028a81):Color(0xffbbbbbb),
                                )),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Divider(
                            height: 1.0,
                            color: chooseStart==true?Color(0xff028a81):Color(0xffbbbbbb),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '至',
                      style: TextStyle(fontSize: 14, color: Color(0xff333333)),
                    ),
                    Container(
                      width: 120,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                chooseStart = false;
                                chooseEnd = true;
                              });
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
//                                  minTime: DateTime(2018, 3, 5),
//                                  maxTime: DateTime(2019, 6, 7),
                                  onChanged: (date) {
                                    print('change $date');
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                    setState(() {
                                      endTime = DateUtil.formatDate(date,format: DateFormats.y_mo_d);
                                    });
                                  }, currentTime: DateTime.now(), locale: LocaleType.zh);
                            },
                            child: Text(endTime,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: chooseEnd==true?Color(0xff028a81):Color(0xffbbbbbb),
                                )),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Divider(
                            height: 2.0,
                            color: chooseEnd==true?Color(0xff028a81):Color(0xffbbbbbb),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 45, left: 27.5, right: 27.5),
                height: 47,
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {

                  },
                  textColor: Colors.white,
                  disabledTextColor: Color(0xffbbbbbb),
                  color: Color(0xff028a81),
                  disabledColor: Color(0xffdddddd),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("一键导出", style: TextStyle(fontSize: 18)),
                ),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
