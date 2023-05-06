import 'package:dio/dio.dart';
import 'package:quiz_game/utils/error_handler/app_exception.dart';

class CheckExceptin {
  static dynamic response(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 500:
        throw ServerEx(message: response.statusMessage);
      default:
        throw FetchDataEx(message: response.statusMessage);
    }
  }
}
