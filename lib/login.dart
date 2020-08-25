import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermanager/color.dart';
import 'package:fluttermanager/httpUtil/DioManager.dart';
import 'package:fluttermanager/httpUtil/NWApi.dart';
import 'package:fluttermanager/httpUtil/NWMethod.dart';
import 'package:fluttermanager/models/login_entity.dart';

import 'common/common.dart';
import 'home.dart';

//void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    //设置状态栏颜色
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //设置为透明
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: createMaterialColor(Color(0xFF028A81)),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
//  LoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

//  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool canSubmit = true;
  String phone = '';
  String password = '';
  //手机号的控制器
  TextEditingController phoneController = TextEditingController(text:"156****2803");//input 设置初始值
  //密码
  TextEditingController psController = TextEditingController(text:"123456");//input 设置初始值
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    void checkSubmit() {
      setState(() {
        if (phone.isNotEmpty && password.isNotEmpty) {
          canSubmit = true;
        } else {
          canSubmit = false;
        }
      });
    }

    void login() {
      //网络请求
      Map<String, dynamic> paramsMap = new Map();
      paramsMap['userPhone'] = phoneController.text;
      paramsMap['password'] = psController.text;
      DioManager().request<LoginEntity>(NWMethod.POST, NWApi.loginPath,
          params: paramsMap, success: (data) {
        print("success data = $data");
        //保存用户信息
        setLogin(data);
        //跳转并关闭当前页面
        Navigator.pushAndRemoveUntil(
          context,
          new MaterialPageRoute(builder: (context) => new HomePage()),
          (route) => route == null,
        );
      }, error: (error) {
        print("error code = ${error.errorCode}, massage = ${error.message}");
      });
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("登录", style: TextStyle(color: Colors.white, fontSize: 17)),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(), //全屏
        color: Colors.white,
        child: SingleChildScrollView(
          //屏幕滑动 解决软键盘弹出屏幕挤压问题
          child: Column(
            children: <Widget>[
              Container(
                height: 220,
                child: Stack(
                  alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                  children: <Widget>[
                    Positioned(
                        top: 30,
                        right: 0,
                        child: Image.asset("images/login_img.png",
                            width: 164.5, height: 141.5)),
                    Positioned(
                      top: 55,
                      left: 25,
                      child: Image.asset(
                        "images/login_logo.png",
                        width: 60,
                      ),
                    ),
                    Positioned(
                      top: 123,
                      left: 25,
                      child: Text(
                        '欢迎使用安康台区经理！',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 21,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 44,
                      child: TextField(
                        controller: phoneController,
                        decoration: new InputDecoration(
                            hintText: '手机号',
                            hintStyle: TextStyle(
                                color: Color(0xffC0C0C0), fontSize: 15),
                            prefixIcon: Image.asset("images/login_phone.png",
                                width: 15),
                            contentPadding: const EdgeInsets.all(15)),
                        keyboardType: TextInputType.phone,
                        style:
                            TextStyle(color: Color(0xff333333), fontSize: 15),
                        onChanged: (value) {
                          //监听输入
                          phone = value.toString();
                          checkSubmit();
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 44,
                      child: TextField(
                        controller: psController,
                        decoration: new InputDecoration(
                            hintText: '密码',
                            hintStyle: TextStyle(
                                color: Color(0xffC0C0C0), fontSize: 15),
                            prefixIcon: Image.asset("images/login_password.png",
                                width: 15),
                            contentPadding: const EdgeInsets.all(15)),
                        keyboardType: TextInputType.visiblePassword,
                        style:
                            TextStyle(color: Color(0xff333333), fontSize: 15),
                        onChanged: (value) {
                          password = value.toString();
                          checkSubmit();
                        },
                        obscureText: true, //隐藏正在编辑的文本
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity, //宽度全屏
                height: 47,
                margin: EdgeInsets.only(top: 90, left: 27.5, right: 27.5),
                child: RaisedButton(
                  onPressed: canSubmit
                      ? () {
                          login();
                        }
                      : null,
                  textColor: Colors.white,
                  disabledTextColor: Color(0xffbbbbbb),
                  color: Color(0xff028a81),
                  disabledColor: Color(0xffdddddd),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("登录", style: TextStyle(fontSize: 18)),
                ),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
