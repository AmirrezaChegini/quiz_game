import 'package:bloc/bloc.dart';
import 'package:quiz_game/bloc/question/question_event.dart';
import 'package:quiz_game/bloc/question/question_state.dart';
import 'package:quiz_game/data/repositories/question_repository.dart';
import 'package:quiz_game/di.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final IQuestionRepository _repository = locator.get();

  QuestionBloc() : super(InitQuestionState()) {
    //get all questions
    on<QuestionEvent>((event, emit) async {
      emit(InitQuestionState());
      var either =
          await _repository.getQuestions(event.category, event.difficulty);

      either.fold((l) {
        emit(ErrorQuestionState(l));
      }, (r) {
        emit(CompletedQuestionState(r));
      });
    });
  }
}
