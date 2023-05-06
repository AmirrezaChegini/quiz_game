import 'package:flutter/material.dart';
import 'package:quiz_game/pages/difficulty_page/difficulty_page.dart';
import 'package:quiz_game/utils/constants.dart';
import 'package:quiz_game/utils/my_color.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        elevation: 8,
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DifficultyPage(
                  title: Constants.titles[index],
                  icon: Constants.icons[index],
                  image: Constants.images[index],
                ),
              ),
            );
          },
          splashColor: Colors.transparent,
          tileColor: MyColor.blu700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          leading: Image.asset(Constants.icons[index]),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          title: Text(
            Constants.titles[index],
            style: const TextStyle(
              color: MyColor.gray,
              fontSize: 20,
              fontFamily: 'pop-regualr',
            ),
          ),
        ),
      ),
    );
  }
}
