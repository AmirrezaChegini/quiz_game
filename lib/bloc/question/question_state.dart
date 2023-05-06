import 'package:quiz_game/data/models/question.dart';

abstract class QuestionState {}

class InitQuestionState extends QuestionState {}

class CompletedQuestionState extends QuestionState {
  final List<Question> questionList;
  CompletedQuestionState(this.questionList);
}

class ErrorQuestionState extends QuestionState {
  final String errorMessage;
  ErrorQuestionState(this.errorMessage);
}
