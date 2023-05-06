import 'package:dartz/dartz.dart';
import 'package:quiz_game/data/datasources/question_datasource.dart';
import 'package:quiz_game/data/models/question.dart';
import 'package:quiz_game/di.dart';
import 'package:quiz_game/utils/error_handler/app_exception.dart';

abstract class IQuestionRepository {
  Future<Either<String, List<Question>>> getQuestions(
      String category, String difficulty);
}

class QuestionRepository implements IQuestionRepository {
  final QuestionDataSource _dataSource = locator.get();

  @override
  Future<Either<String, List<Question>>> getQuestions(
      String category, String difficulty) async {
    try {
      List<Question> questionList =
          await _dataSource.getQuestion(category, difficulty);

      // when specific categoet is null
      if (questionList.isEmpty) {
        return throw NotFoundEx();
      }

      return right(questionList);
    } on AppException catch (ex) {
      return left(ex.message);
    }
  }
}
