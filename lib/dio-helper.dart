import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {required String urlMethode, required Map<String, dynamic> query}) async {
    return await dio.get(urlMethode, queryParameters: query);
  }
}
