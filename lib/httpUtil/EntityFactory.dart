//json转换辅助工厂，把json转为T
import 'package:fluttermanager/models/login_entity.dart';
import 'package:fluttermanager/models/meter_list_entity.dart';
import 'package:fluttermanager/models/team_list_entity.dart';

class EntityFactory{
  static T generateOBJ<T>(json) {
    if (json == null) {
      return null;
    }
//可以在这里加入任何需要并且可以转换的类型，例如下面
    else if (T.toString() == "LoginEntity") {
      return LoginEntity.fromJson(json) as T;
    }else if(T.toString() == "MeterListEntity"){
      return MeterListEntity.fromJson(json) as T;
    }else if(T.toString() == "TeamListEntity"){
      return TeamListEntity.fromJson(json) as T;
    }
    else {
      return json as T;
    }
  }
}