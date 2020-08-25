import 'package:fluttermanager/models/login_entity.dart';

//登录信息
LoginEntity _loginEntity = new LoginEntity();
setLogin(LoginEntity entity){
  _loginEntity = entity;
}
LoginEntity getLogin(){
  return _loginEntity;
}
