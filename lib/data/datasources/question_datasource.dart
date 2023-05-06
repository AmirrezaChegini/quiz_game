import 'package:dio/dio.dart';
import 'package:quiz_game/data/models/question.dart';
import 'package:quiz_game/di.dart';
import 'package:quiz_game/utils/category_id.dart';
import 'package:quiz_game/utils/error_handler/app_exception.dart';
import 'package:quiz_game/utils/error_handler/check_exception.dart';

abstract class QuestionDataSource {
  Future<List<Question>> getQuestion(String category, String difficulty);
}

class QuestionRemote implements QuestionDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<Question>> getQuestion(String category, String difficulty) async {
    try {
      Response response = await _dio.get(
        'api.php',
        queryParameters: {
          'amount': 20,
          'category': CategoryId.getID(category),
          'difficulty': difficulty.toLowerCase(),
        },
      ).onError(
        (DioError error, stackTrace) => CheckExceptin.response(error.response!),
      );

      List<Question> questions = response.data['results']
          .map<Question>((e) => Question.fromMapJson(e))
          .toList();

      return questions;
    } catch (ex) {
      throw FetchDataEx();
    }
  }
}
