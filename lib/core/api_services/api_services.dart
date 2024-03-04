import 'package:dio/dio.dart';
import 'package:ecommerce/core/cache_helper/cache_helper.dart';

class ApiServices {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        contentType: 'application/json',
      ),
    );
  }

  Future<dynamic> getData({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'lang': CacheHelper.getData(key: 'langAr') == true ? 'ar' : 'en' ,
      'Authorization': CacheHelper.getData(key: 'token'),
    };
    var response = await dio.get(
      path,
      queryParameters: query,
    );
    return response.data;
  }

  Future<Response> postData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'lang': CacheHelper.getData(key: 'langAr') == true ? 'ar' : 'en' ,
      'Authorization': CacheHelper.getData(key: 'token'),
    };

    return await dio.post(
      path,
      data: data,
    );
  }

  Future<Response> putData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'lang': CacheHelper.getData(key: 'langAr') == true ? 'ar' : 'en' ,
      'Authorization': CacheHelper.getData(key: 'token'),
    };

    return await dio.put(
      path,
      data: data,
    );
  }
}
