//数据基类2，返回的参数为 {“code”: 0, “message”: “”, “data”: []}
import 'dart:convert';

import 'package:fluttermanager/httpUtil/EntityFactory.dart';

class BaseListEntity<T>{
  int errorCode;
  String message;
  List<T> data;

  BaseListEntity({this.errorCode,this.message,this.data});

  factory BaseListEntity.fromJson(json){
    List<T> mData = new List<T>();
    //json转化为对象
    var jsonObj = jsonDecode(json);
    if(jsonObj["data"] != null){
      //遍历data并转换为我们传进来的类型
      (jsonObj["data"] as List).forEach((element) {
        mData.add(EntityFactory.generateOBJ<T>(element));
      });
    }
    return BaseListEntity(
      errorCode: jsonObj['errorCode'],
      message: jsonObj['message'],
      data: mData
    );
  }
}