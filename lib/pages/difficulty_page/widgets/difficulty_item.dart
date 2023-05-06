import 'package:flutter/material.dart';
import 'package:quiz_game/pages/question_page/question_page.dart';
import 'package:quiz_game/utils/constants.dart';
import 'package:quiz_game/utils/my_color.dart';

class DifficultyItem extends StatelessWidget {
  const DifficultyItem({
    super.key,
    required this.index,
    required this.title,
  });

  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: MyColor.blu700,
        elevation: 8,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuestionPage(
                  category: title,
                  difficulty: Constants.diffculties[index],
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(8),
          splashColor: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.09,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              Constants.diffculties[index],
              style: const TextStyle(
                fontFamily: 'pop-bold',
                fontSize: 20,
                color: MyColor.gray,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
