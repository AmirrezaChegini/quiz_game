import 'package:flutter_bloc/flutter_bloc.dart';

class AnswersCubit extends Cubit<int> {
  AnswersCubit() : super(-1);
  int i = -1;
  String chooseAnswer = '';
  int correctAnswers = 0;

  //for changing index of answer list tile
  void currentIndex(int index) {
    i = index;
    emit(i);
  }

  //store choose answer in variable
  void replaceChooseAnswer(String answer) {
    chooseAnswer = answer;
  }

  //checked for correct answer after submit btn clicked
  void checkAnswer(String correctAnswer) {
    chooseAnswer == correctAnswer ? correctAnswers++ : correctAnswers;
  }

  void resetIndex() {
    i = -1;
    emit(i);
  }

  void resetAnswers() {
    chooseAnswer = '';
    correctAnswers = 0;
  }
}
