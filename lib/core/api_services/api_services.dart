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
    required String endPoint,
    Map<String,dynamic>? query,
  }) async{
    dio.options.headers = {
      'lang' : 'en',
      'Authorization' : CacheHelper.getData(key: 'token'),
    };
    var response = await dio.get(
      endPoint,
      queryParameters: query,
    );
    return response.data;
  }

  Future<Response> postData({
    required String path,
    required Map<String,dynamic> data ,
  }) async{
    dio.options.headers = {
      'lang' : 'en',
      'Authorization' : CacheHelper.getData(key: 'token'),
    };

    return await dio.post(
      path,
      data: data,
    );
  }
}