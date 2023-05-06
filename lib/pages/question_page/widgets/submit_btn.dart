import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/cubit/answers_cubit.dart';
import 'package:quiz_game/cubit/question_page_cubit.dart';
import 'package:quiz_game/pages/result_page/result_page.dart';
import 'package:quiz_game/utils/my_color.dart';

class SubmitBtn extends StatelessWidget {
  const SubmitBtn({
    super.key,
    required this.length,
    required this.correctAnswer,
  });

  final int length;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<AnswersCubit>(context).resetIndex();
        BlocProvider.of<AnswersCubit>(context).checkAnswer(correctAnswer);
        int state = BlocProvider.of<QUestionPageCubit>(context).state;
        if (state < length - 1) {
          BlocProvider.of<QUestionPageCubit>(context).nextQuestion();
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ResultPage()),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColor.orange,
        minimumSize: const Size.fromHeight(55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          color: MyColor.gray,
          fontSize: 20,
          fontFamily: 'pop-Medium',
        ),
      ),
      child: BlocBuilder<QUestionPageCubit, int>(
        builder: (context, state) {
          if (state == length - 1) {
            return const Text('Finish');
          }
          return const Text('Submit');
        },
      ),
    );
  }
}
