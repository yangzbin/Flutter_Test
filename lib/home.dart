import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermanager/search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'user.dart';

class HomePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('台区经理', style: TextStyle(color: Colors.white, fontSize: 17)),
          centerTitle: true,
          automaticallyImplyLeading: false, //隐藏返回按钮
        ),
        body: Container(
          constraints: BoxConstraints.expand(), //全屏
          color: Color(0xfff8f8f8),
          child: Column(
            children: <Widget>[
              Container(
                height: 44,
                color: Colors.white,
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return SearchPage();
                        }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Color(0xffe9e9e9),
                    ),
                    padding: EdgeInsets.only(left: 17.5),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          "images/home_icon_search.png",
                          width: 14.93,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 12.5),
                          child: Text(
                            '搜索姓名或关键字',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffaaaaaa),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 48, left: 8, right: 8, bottom: 19),
                child: Image.asset("images/home_img.png"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ItemView(
                    text: '扫一扫',
                    imgUrl: 'images/home_icon_sweep.png',
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: "扫一扫",
                        backgroundColor: Color(0xFF028A81),
                        textColor: Colors.white,
                      );
                    },
                  ),
                  ItemView(
                    text: '我的团队',
                    imgUrl: 'images/home_icon_team.png',
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: "我的团队",
                        backgroundColor: Color(0xFF028A81),
                        textColor: Colors.white,
                      );
                    },
                  ),
                  ItemView(
                    text: '个人中心',
                    imgUrl: 'images/home_icon_user.png',
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UserPage();
                      }));
                    },
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 76),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      textColor: Colors.white,
                      color: Color(0xff339f98),
                      child: Text(
                        '一键导出',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
//                        Fluttertoast.showToast(msg: '一键导出');
                        Fluttertoast.showToast(
                          msg: "一键导出",
                          backgroundColor: Color(0xFF028A81),
                          textColor: Colors.white,
                        );
                      },
                      padding: EdgeInsets.only(
                          top: 17, bottom: 17, left: 28, right: 28),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      color: Color(0xff009aee),
                      child: Text(
                        '一键导入',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: "一键导入",
                          backgroundColor: Color(0xFF028A81),
                          textColor: Colors.white,
                        );
                      },
                      padding: EdgeInsets.only(
                          top: 17, bottom: 17, left: 28, right: 28),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

//自定组件
class ItemView extends StatelessWidget {
  ItemView({@required this.text, @required this.imgUrl, this.onPressed});

  final String text;
  final String imgUrl;

  //点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Image.asset(imgUrl, width: 64),
          Text(
            text,
            style: TextStyle(fontSize: 14, color: Color(0xff333333)),
          )
        ],
      ),
    );
  }
}
