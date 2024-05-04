import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkClient {
  late final Dio _dio;

  NetworkClient({required String baseUrl}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
      connectTimeout: const Duration(milliseconds: 5000), // 5 seconds
      receiveTimeout: const Duration(milliseconds: 3000), // 30 seconds
    ));

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      return await _dio.get(path,
          queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> post(String path,
      {data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      return await _dio.post(path,
          data: data, queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError(DioException error) {
    String errorDescription = "";
    switch (error.type) {
      case DioExceptionType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioExceptionType.receiveTimeout ||
            DioExceptionType.connectionTimeout ||
            DioExceptionType.sendTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioExceptionType.unknown:
        errorDescription =
            "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.badResponse:
        errorDescription =
            "Received invalid status code: ${error.response?.statusCode}";
        break;
      case DioExceptionType.badCertificate:
        errorDescription = "Bad certificate";

      case DioExceptionType.connectionError:
        errorDescription = "Connection error with API server";
    }
    return Exception(errorDescription);
  }
}
