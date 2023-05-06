import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/cubit/answers_cubit.dart';
import 'package:quiz_game/utils/constants.dart';
import 'package:quiz_game/utils/my_color.dart';

class AnswerList extends StatelessWidget {
  const AnswerList({super.key, required this.answers});
  final List answers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        answers.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Material(
            color: Colors.transparent,
            elevation: 8,
            borderRadius: BorderRadius.circular(50),
            child: BlocBuilder<AnswersCubit, int>(
              builder: (context, state) => ListTile(
                onTap: () {
                  BlocProvider.of<AnswersCubit>(context).currentIndex(index);
                  BlocProvider.of<AnswersCubit>(context)
                      .replaceChooseAnswer(answers[index]);
                },
                selected: state == index ? true : false,
                tileColor: MyColor.gray,
                textColor: MyColor.blue900,
                selectedTileColor: MyColor.orange,
                selectedColor: MyColor.gray,
                splashColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                title: Text(
                  answers[index],
                  style: const TextStyle(
                    fontFamily: 'pop-medium',
                    fontSize: 20,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                leading: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  elevation: 8,
                  child: CircleAvatar(
                    backgroundColor: MyColor.orange,
                    radius: 25,
                    child: Text(
                      Constants.options[index],
                      style: const TextStyle(
                        fontFamily: 'pop-bold',
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
