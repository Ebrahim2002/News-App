import 'package:dio/dio.dart';
class DioHelper{
  //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3b0037d41f6b42b59e39608377207adb
  // baseUrl : https://newsapi.org/
  // path : v2/top-headlines
  // query : ?country=eg&category=business
  // apiKey=3b0037d41f6b42b59e39608377207adb
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org/",
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response?> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
  //get data from api using dio
}