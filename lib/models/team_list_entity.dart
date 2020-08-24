/// createTime : 1589510614000
/// deleteState : 0
/// lastLoginTime : 1589882019000
/// lastModifyTime : 1589510614000
/// parentUserId : 178
/// portraitUrl : "/file/portrait/header_img_man.png"
/// realName : "祝伟政"
/// region : "海亮新英里小区"
/// sex : 0
/// userId : 177
/// userName : "18202992710"
/// userPhone : "18202992710"
/// userPwd : "B6BD39FDC450D0F0411EB5DCF46CFDD2"
/// userRole : 2

class TeamListEntity {
  int _createTime;
  int _deleteState;
  int _lastLoginTime;
  int _lastModifyTime;
  int _parentUserId;
  String _portraitUrl;
  String _realName;
  String _region;
  int _sex;
  int _userId;
  String _userName;
  String _userPhone;
  String _userPwd;
  int _userRole;

  int get createTime => _createTime;
  int get deleteState => _deleteState;
  int get lastLoginTime => _lastLoginTime;
  int get lastModifyTime => _lastModifyTime;
  int get parentUserId => _parentUserId;
  String get portraitUrl => _portraitUrl;
  String get realName => _realName;
  String get region => _region;
  int get sex => _sex;
  int get userId => _userId;
  String get userName => _userName;
  String get userPhone => _userPhone;
  String get userPwd => _userPwd;
  int get userRole => _userRole;

  TeamListEntity({
      int createTime, 
      int deleteState, 
      int lastLoginTime, 
      int lastModifyTime, 
      int parentUserId, 
      String portraitUrl, 
      String realName, 
      String region, 
      int sex, 
      int userId, 
      String userName, 
      String userPhone, 
      String userPwd, 
      int userRole}){
    _createTime = createTime;
    _deleteState = deleteState;
    _lastLoginTime = lastLoginTime;
    _lastModifyTime = lastModifyTime;
    _parentUserId = parentUserId;
    _portraitUrl = portraitUrl;
    _realName = realName;
    _region = region;
    _sex = sex;
    _userId = userId;
    _userName = userName;
    _userPhone = userPhone;
    _userPwd = userPwd;
    _userRole = userRole;
}

  TeamListEntity.fromJson(dynamic json) {
    _createTime = json["createTime"];
    _deleteState = json["deleteState"];
    _lastLoginTime = json["lastLoginTime"];
    _lastModifyTime = json["lastModifyTime"];
    _parentUserId = json["parentUserId"];
    _portraitUrl = json["portraitUrl"];
    _realName = json["realName"];
    _region = json["region"];
    _sex = json["sex"];
    _userId = json["userId"];
    _userName = json["userName"];
    _userPhone = json["userPhone"];
    _userPwd = json["userPwd"];
    _userRole = json["userRole"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["createTime"] = _createTime;
    map["deleteState"] = _deleteState;
    map["lastLoginTime"] = _lastLoginTime;
    map["lastModifyTime"] = _lastModifyTime;
    map["parentUserId"] = _parentUserId;
    map["portraitUrl"] = _portraitUrl;
    map["realName"] = _realName;
    map["region"] = _region;
    map["sex"] = _sex;
    map["userId"] = _userId;
    map["userName"] = _userName;
    map["userPhone"] = _userPhone;
    map["userPwd"] = _userPwd;
    map["userRole"] = _userRole;
    return map;
  }

}