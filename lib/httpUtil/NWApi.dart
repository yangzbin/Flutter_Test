//接口
import 'package:cookie_jar/cookie_jar.dart';

class NWApi{
  static final CookieJar cookieJar = new CookieJar();
  static final baseApi = 'https://www.xxx.com/areamanager/';
  static final loginPath = 'user/login';//登录
  static final meterList = 'meter/list';//电表列表
  static final teamList = 'user/my/team';//我的团队
}