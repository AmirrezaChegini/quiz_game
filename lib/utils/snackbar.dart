import 'package:flutter/material.dart';
import 'package:quiz_game/utils/my_color.dart';

showMessage(String title, BuildContext context, Function() onPressed) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        style: const TextStyle(
          fontFamily: 'pop-medium',
          color: MyColor.gray,
        ),
      ),
      action: SnackBarAction(label: 'Retry', onPressed: onPressed),
      backgroundColor: MyColor.blu700,
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}
