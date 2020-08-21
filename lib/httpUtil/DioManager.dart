import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:fluttermanager/httpUtil/NWApi.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'BaseEntity.dart';
import 'BaseListEntity.dart';
import 'ErrorEntity.dart';
import 'NWMethod.dart';

/*
 * 封装 restful 请求
 */
class DioManager {
  //创建Dio的单例辅助类，并初始化Dio和对Dio进行一些全局的参数设置：
  static final DioManager _dioManager = DioManager._internal();

  factory DioManager() => _dioManager;
  Dio dio;

  DioManager._internal() {
    if (dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: NWApi.baseApi,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        receiveDataWhenStatusError: false,
        connectTimeout: 30000,
        receiveTimeout: 3000,
//        headers: {"Cookie": NWApi.cookieJar.loadForRequest(Uri.parse(NWApi.baseApi+NWApi.loginPath))[0].value},
      ); //设置cookie
      dio = Dio(options);
      dio.interceptors.add(CookieManager(NWApi.cookieJar));
//      dio.interceptors.add(Global.cookieInterceptor);//cookie拦截器
    }
  }

// 请求，返回参数为 T
// method：请求方法，NWMethod.POST等
// path：请求地址
// params：请求参数
// success：请求成功回调
// error：请求失败回调
  Future request<T>(NWMethod method, String path,
      {Map<String, dynamic> params,
      Function(T) success,
      Function(ErrorEntity) error}) async {
    // 打印:请求地址-请求方式-请求参数
    print("请求头部:" + dio.options.headers.toString());
    print(
        '请求地址：【' + NWMethodValues[method] + '  ' + NWApi.baseApi + path + '】');
    print('请求参数：' + params.toString());
    try {
      Response response = await dio.request(path,
          queryParameters: params,
          options: Options(method: NWMethodValues[method]));
      if (response != null) {
//        if (response.headers['set-cookie'] != null) {
//          String session =
//              response.headers['set-cookie'][0].toString().split(";")[0];
//          print("session:" + session);
//          List<Cookie> cookies = new List();
//          cookies.add(Cookie("Cookie", session));
//          NWApi.cookieJar.saveFromResponse(
//              Uri.parse(NWApi.baseApi + NWApi.loginPath), cookies);
//        }
        //返回
        //print('网络请求返回实体：' + response.toString());
        LogUtil.init(tag: "网络请求返回实体",isDebug: true,maxLen: 256);
        LogUtil.e(response.toString());
        BaseEntity entity = BaseEntity<T>.fromJson(response.data);
        if (entity.errorCode == 0) {
          success(entity.data);
        } else {
          _error(entity.message);
          error(ErrorEntity(
              errorCode: entity.errorCode, message: entity.message));
        }
      } else {
        error(ErrorEntity(errorCode: -1, message: "未知错误"));
      }
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

  // 请求，返回参数为 List<T>
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future requestList<T>(NWMethod method, String path,
      {Map<String, dynamic> params,
      Function(List<T>) success,
      Function(ErrorEntity) error}) async {
    // 打印:请求地址-请求方式-请求参数
    print(
        '请求地址：【' + NWMethodValues[method] + '  ' + NWApi.baseApi + path + '】');
    print('请求参数：' + params.toString());
    try {
      Response response = await dio.request(path,
          queryParameters: params,
          options: Options(method: NWMethodValues[method]));
      if (response != null) {
        //返回
        print('网络请求返回：' + response.data.toString());
        BaseListEntity entity = BaseListEntity<T>.fromJson(response.data);
        if (entity.errorCode == 0) {
          success(entity.data);
        } else {
          _error(entity.message);
          error(ErrorEntity(
              errorCode: entity.errorCode, message: entity.message));
        }
      } else {
        error(ErrorEntity(errorCode: -1, message: "未知错误"));
      }
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

  _error(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Color(0xFF028A81),
      textColor: Colors.white,
    );
  }

  // 错误信息
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        {
          return ErrorEntity(errorCode: -1, message: "请求取消");
        }
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        {
          return ErrorEntity(errorCode: -1, message: "连接超时");
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        {
          return ErrorEntity(errorCode: -1, message: "请求超时");
        }
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        {
          return ErrorEntity(errorCode: -1, message: "响应超时");
        }
        break;
      case DioErrorType.RESPONSE:
        {
          try {
            int errCode = error.response.statusCode;
            String errMsg = error.response.statusMessage;
            return ErrorEntity(errorCode: errCode, message: errMsg);
//          switch (errCode) {
//            case 400: {
//              return ErrorEntity(code: errCode, message: "请求语法错误");
//            }
//            break;
//            case 403: {
//              return ErrorEntity(code: errCode, message: "服务器拒绝执行");
//            }
//            break;
//            case 404: {
//              return ErrorEntity(code: errCode, message: "无法连接服务器");
//            }
//            break;
//            case 405: {
//              return ErrorEntity(code: errCode, message: "请求方法被禁止");
//            }
//            break;
//            case 500: {
//              return ErrorEntity(code: errCode, message: "服务器内部错误");
//            }
//            break;
//            case 502: {
//              return ErrorEntity(code: errCode, message: "无效的请求");
//            }
//            break;
//            case 503: {
//              return ErrorEntity(code: errCode, message: "服务器挂了");
//            }
//            break;
//            case 505: {
//              return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
//            }
//            break;
//            default: {
//              return ErrorEntity(code: errCode, message: "未知错误");
//            }
//          }
          } on Exception catch (_) {
            return ErrorEntity(errorCode: -1, message: "未知错误");
          }
        }
        break;
      default:
        {
          return ErrorEntity(errorCode: -1, message: error.message);
        }
    }
  }
}
