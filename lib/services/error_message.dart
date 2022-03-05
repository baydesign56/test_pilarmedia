import 'package:dio/dio.dart';

Future<String> errorMessage(DioErrorType dioErrorType) async {
  switch (dioErrorType) {
    case DioErrorType.cancel:
      return "Error cancel";
    case DioErrorType.connectTimeout:
      return "Error Request Timeout";

    case DioErrorType.sendTimeout:
      return "Error Send Timeout";

    case DioErrorType.receiveTimeout:
      return "Error Request Timeout";

    case DioErrorType.response:
      return "Error Response";

    case DioErrorType.other:
      return "Anda Sedang Offline";
  }
}
