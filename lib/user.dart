import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermanager/common/common.dart';
import 'package:fluttermanager/psword.dart';
import 'package:fluttermanager/routeUtil/FadeRoute.dart';
import 'package:fluttermanager/widget/ItemInputView.dart';
import 'package:fluttermanager/widget/ItemView.dart';
import 'package:fluttermanager/widget/PhotoViewSimpleScreen.dart';
import 'package:image_picker/image_picker.dart';

class UserPage extends StatefulWidget {
  @override
  _userPageState createState() => _userPageState();
}

class _userPageState extends State<UserPage> {
  //手机号的控制器
  TextEditingController phoneController = TextEditingController(text: getLogin().userPhone);//input 设置初始值

  //邮箱
  TextEditingController emailController = TextEditingController();

  //修改密码
  void changePassword() {
    //Fluttertoast.showToast(msg: "修改密码");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PswordPage();
    }));
  }

  //退出应用
  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  File _image;
  final _picker = ImagePicker();

  //弹框
  showSelectDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Text('设置图像'),
            children: [
              new SimpleDialogOption(
                child: new Text('相册'),
                onPressed: () {
                  //Fluttertoast.showToast(msg: "相册");
                  Navigator.of(context).pop();
                  _openGallery();
                },
              ),
              new SimpleDialogOption(
                child: new Text('拍照'),
                onPressed: () {
                  //Fluttertoast.showToast(msg: "拍照");
                  Navigator.of(context).pop();
                  _takePhoto();
                },
              )
            ],
          );
        });
  }

  /*拍照*/
  _takePhoto() async {
    var image = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }

  /*底部弹出选择框*/
  Future _openModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('男',textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.pop(context, 0);
                  },
                ),
                ListTile(
                  title: Text('女',textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.pop(context, 1);
                  },
                ),
                ListTile(
                  title: Text('取消',textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.pop(context, '取消');
                  },
                ),
              ],
            ),
          );
        }
    );
    //print(option);
    setState(() {
      if(option ==0 || option ==1){
        getLogin().setSex = option;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text("个人中心", style: TextStyle(color: Colors.white, fontSize: 17)),
          centerTitle: true,
          elevation: 0, //去掉底部阴影
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(), //全屏
            color: Color(0xfff8f8f8),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 114,
                    color: Color(0xff028a81),
                    padding: EdgeInsets.only(
                        left: 16, top: 10, right: 16, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start, //顶部对齐
                      children: <Widget>[
                        Material(
                          color: Color(0xff028a81),
                          child: Ink(
                            child: InkWell(
                              onTap: () {
                                //查看大图
//                                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                                  return PhotoViewSimpleScreen(
//                                    imageProvider: FileImage(_image),
//                                    heroTag: 'simple',
//                                  );
//                                }));
                                Navigator.of(context).push(new FadeRoute(page: PhotoViewSimpleScreen(
                                  imageProvider:FileImage(_image),
                                  heroTag: 'simple',
                                )));
                                //多图预览
                                //FadeRoute是自定义的切换过度动画（渐隐渐现） 如果不需要 可以使用默认的MaterialPageRoute
//                                Navigator.of(context).push(new FadeRoute(page: PhotoViewGalleryScreen(
//                                  images:imgs,//传入图片list
//                                  index: index,//传入当前点击的图片的index
//                                  heroTag: img,//传入当前点击的图片的hero tag （可选）
//                                )));
                              },
                              onLongPress: (){
                                //修改图像
                                showSelectDialog(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 12),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: _image != null
                                            ? FileImage(_image)
                                            : AssetImage(
                                                'images/user_img_header.png'))),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start, //居左对齐
                            children: <Widget>[
                              Text(getLogin().realName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  )),
                              Text(
                                '负责区域',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                              Expanded(
                                child: Text(
                                  getLogin().region,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Column(
                      children: <Widget>[
                        ItemView(
                          lable: '真实姓名',
                          value: getLogin().realName,
                          width: 60,
                        ),
                        Divider(
                          height: 1.0,
                          indent: 15,
                          color: Color(0xfff8f8f8),
                        ),
                        //分割线
                        ItemView(
                          lable: '性别',
                          value: getLogin().sex==0?'男':'女',
                          width: 60,
                          onPressed: (){
                            _openModalBottomSheet();
                          },
                        ),
                        Divider(
                          height: 1.0,
                          indent: 15,
                          color: Color(0xfff8f8f8),
                        ),
                        ItemInputView(
                          lable: '联系电话',
                          hint: '请填写',
                          inputType: TextInputType.phone,
                          controller: phoneController,
                        ),
                        Divider(
                          height: 1.0,
                          indent: 15,
                          color: Color(0xfff8f8f8),
                        ),
                        ItemInputView(
                          lable: '邮箱',
                          hint: '请填写',
                          inputType: TextInputType.emailAddress,
                          controller: emailController,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    padding: EdgeInsets.all(15),
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        changePassword();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "修改密码",
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff999999)),
                            textAlign: TextAlign.start,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff999999),
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 36),
                    padding: EdgeInsets.all(15),
                    color: Colors.white,
                    child: InkWell(
                      onTap: () async {
                        //Fluttertoast.showToast(msg: phoneController.text+emailController.text);
//                        Navigator.push(context, MaterialPageRoute(builder: (context) {
//                          return LoginPage();
//                        }));
                        await pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "切换账号",
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff333333)),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

