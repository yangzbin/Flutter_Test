// 1,添加全局拦截器 cookie.dart
import 'package:dio/dio.dart';
class CookieInterceptor extends Interceptor {
  String session = '';
  @override
  Future onResponse(Response response) async {
    if(response.headers['set-cookie']!=null){
      session = response.headers['set-cookie'][0].toString().split(";")[0];
    }
    print("session:"+session);
    return response;
  }
}