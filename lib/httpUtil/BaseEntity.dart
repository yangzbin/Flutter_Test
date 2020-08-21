//数据基类，返回的参数为 {“errorCode”: 0, “message”: “”, “data”: {}}
import 'dart:convert';

import 'package:fluttermanager/httpUtil/EntityFactory.dart';

class BaseEntity<T>{
  int errorCode;
  String message;
  T data;

  BaseEntity({this.errorCode,this.message,this.data});

  factory BaseEntity.fromJson(json){
    //json转化为对象
    var jsonObj = jsonDecode(json);
    return BaseEntity(
      errorCode: jsonObj["errorCode"],
      message: jsonObj["message"],
      // data值需要经过工厂转换为我们传进来的类型
      data: EntityFactory.generateOBJ<T>(jsonObj["data"]),
    );
  }
}