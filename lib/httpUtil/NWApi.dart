//接口
import 'package:cookie_jar/cookie_jar.dart';

class NWApi{
  static final CookieJar cookieJar = new CookieJar();
  static final baseApi = 'https://www.sitopclouds.com/areamanager/';
  static final loginPath = 'user/login';//登录
  static final meterList = 'meter/list';//电表列表
}