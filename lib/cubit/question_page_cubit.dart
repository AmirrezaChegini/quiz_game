import 'package:flutter_bloc/flutter_bloc.dart';

class QUestionPageCubit extends Cubit<int> {
  QUestionPageCubit() : super(0);
  int index = 0;

  //when submit btn cliked
  void nextQuestion() {
    index++;
    emit(index);
  }

  //when question page create
  void resetQuestion() {
    index = 0;
    emit(index);
  }
}

//thic cubit class for changing current question
