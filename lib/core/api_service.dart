import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "https://newsapi.org/v2";
  final Dio dio;
  ApiService(this.dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<dynamic> post({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    dio.options.headers.addAll({
      "Content-Type": "application/json",
    });

    var response = await dio.post(
      endpoint,
      data: data,
    );

    return response.data;
  }

  Future<dynamic> put({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    dio.options.headers.addAll({
      "Content-Type": "application/json",
    });

    var response = await dio.put(
      endpoint,
      data: data,
    );

    return response.data;
  }
}
