import 'package:flutter/material.dart';
import 'package:quiz_game/utils/my_color.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColor.blu700,
      toolbarHeight: 80,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'pop-medium',
          fontSize: 26,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
