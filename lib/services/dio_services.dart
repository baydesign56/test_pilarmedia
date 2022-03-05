import 'package:dio/dio.dart';

class DioServices {
  static Dio dio = Dio(
    BaseOptions(
      sendTimeout: 8000,
      connectTimeout: 8000,
      receiveTimeout: 8000,
      responseType: ResponseType.plain,
    ),
  );
}
