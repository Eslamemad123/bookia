import 'package:bookia/core/services/API/api_endPoints.dart';
import 'package:dio/dio.dart';

class Dio_Provider {
  static late Dio dio;
  static intit() {
    dio = Dio(BaseOptions(baseUrl: API_EndPoint.baseURL));
  }

  static Future<Response> Post({
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    required String endPoint,
  }) async {
    return await dio.post(
      endPoint,
      data: data,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
  }

  static Future<Response> Get({
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    required String endPoint,
  }) async {
    return await dio.get(
      endPoint,
      data: data,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
  }

  static Future<Response> Put({
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    required String endPoint,
  }) async {
    return await dio.put(
      endPoint,
      data: data,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
  }

  static Future<Response> Delete({
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    required String endPoint,
  }) async {
    return await dio.delete(
      endPoint,
      data: data,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
  }
}
