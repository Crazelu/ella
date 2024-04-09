import 'package:dio/dio.dart';

class ApiClient {
  ApiClient({
    required this.baseUrl,
    List<Interceptor> interceptors = const [],
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    for (final interceptor in interceptors) {
      _dio.interceptors.add(interceptor);
    }
  }

  final String baseUrl;

  late final Dio _dio;

  Dio get dio => _dio;
}
