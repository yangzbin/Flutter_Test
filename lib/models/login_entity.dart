/// sex : 0
/// userPhone : "18291510005"
/// userPwd : "B1C30E71F5CDA3FF24F1C78AB1E46950"
/// userName : "18291510005"
/// userId : 179
/// lastLoginTime : 1597907791466
/// realName : "赵主任"
/// createTime : 1583917794000
/// lastModifyTime : 1589881803000
/// region : "安康供电局"
/// userRole : 1
/// deleteState : 0

class LoginEntity {
  int _sex;
  String _userPhone;
  String _userPwd;
  String _userName;
  int _userId;
  int _lastLoginTime;
  String _realName;
  int _createTime;
  int _lastModifyTime;
  String _region;
  int _userRole;
  int _deleteState;

  int get sex => _sex;
  String get userPhone => _userPhone;
  String get userPwd => _userPwd;
  String get userName => _userName;
  int get userId => _userId;
  int get lastLoginTime => _lastLoginTime;
  String get realName => _realName;
  int get createTime => _createTime;
  int get lastModifyTime => _lastModifyTime;
  String get region => _region;
  int get userRole => _userRole;
  int get deleteState => _deleteState;


  set setSex(int value) {
    _sex = value;
  }

  LoginEntity({
      int sex, 
      String userPhone, 
      String userPwd, 
      String userName, 
      int userId, 
      int lastLoginTime, 
      String realName, 
      int createTime, 
      int lastModifyTime, 
      String region, 
      int userRole, 
      int deleteState}){
    _sex = sex;
    _userPhone = userPhone;
    _userPwd = userPwd;
    _userName = userName;
    _userId = userId;
    _lastLoginTime = lastLoginTime;
    _realName = realName;
    _createTime = createTime;
    _lastModifyTime = lastModifyTime;
    _region = region;
    _userRole = userRole;
    _deleteState = deleteState;
}

  LoginEntity.fromJson(dynamic json) {
    _sex = json["sex"];
    _userPhone = json["userPhone"];
    _userPwd = json["userPwd"];
    _userName = json["userName"];
    _userId = json["userId"];
    _lastLoginTime = json["lastLoginTime"];
    _realName = json["realName"];
    _createTime = json["createTime"];
    _lastModifyTime = json["lastModifyTime"];
    _region = json["region"];
    _userRole = json["userRole"];
    _deleteState = json["deleteState"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["sex"] = _sex;
    map["userPhone"] = _userPhone;
    map["userPwd"] = _userPwd;
    map["userName"] = _userName;
    map["userId"] = _userId;
    map["lastLoginTime"] = _lastLoginTime;
    map["realName"] = _realName;
    map["createTime"] = _createTime;
    map["lastModifyTime"] = _lastModifyTime;
    map["region"] = _region;
    map["userRole"] = _userRole;
    map["deleteState"] = _deleteState;
    return map;
  }
}