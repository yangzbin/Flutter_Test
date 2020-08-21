//数据基类2，返回的参数为 {“code”: 0, “message”: “”, “data”: []}
import 'package:fluttermanager/httpUtil/EntityFactory.dart';

class BaseListEntity<T>{
  int errorCode;
  String message;
  List<T> data;

  BaseListEntity({this.errorCode,this.message,this.data});

  factory BaseListEntity.fromJson(json){
    List<T> mData = new List<T>();
    if(json["data"] != null){
      //遍历data并转换为我们传进来的类型
      (json["data"] as List).forEach((element) {
        mData.add(EntityFactory.generateOBJ<T>(element));
      });
    }
    return BaseListEntity(
      errorCode: json['errorCode'],
      message: json['message'],
      data: mData
    );
  }
}