import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/cubit/answers_cubit.dart';
import 'package:quiz_game/pages/home_page/home_page.dart';
import 'package:quiz_game/utils/my_color.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    int correctAnswers = BlocProvider.of<AnswersCubit>(context).correctAnswers;

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false);
          return true;
        },
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: MyColor.gray,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/trophy.png',
                  width: 200,
                  height: 200,
                ),
                const Text(
                  'Congrats!',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'pop-bold',
                    color: MyColor.blue900,
                  ),
                ),
                Text(
                  '${correctAnswers * 5}% Score',
                  style: const TextStyle(
                    fontSize: 30,
                    fontFamily: 'pop-bold',
                    color: MyColor.green,
                  ),
                ),
                const Text(
                  'Quiz Completed Successfully',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'pop-bold',
                    color: MyColor.blue900,
                  ),
                ),
                Text(
                  '$correctAnswers Answer is Correct',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'pop-bold',
                    color: MyColor.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
