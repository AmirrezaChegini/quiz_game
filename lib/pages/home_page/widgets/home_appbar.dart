import 'package:flutter/material.dart';
import 'package:quiz_game/utils/my_color.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColor.blu700,
      toolbarHeight: 80,
      leading: const Icon(Icons.menu, size: 30),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Material(
            color: Colors.transparent,
            elevation: 7,
            shape: const CircleBorder(),
            child: Image.asset(
              'assets/icons/account.png',
              width: 50,
              height: 50,
            ),
          ),
        ),
      ],
      title: const Text(
        'Quiz App',
        style: TextStyle(
          fontFamily: 'pop-medium',
          fontSize: 30,
          shadows: [
            BoxShadow(
              color: MyColor.black,
              blurRadius: 12,
              offset: Offset(0, 5),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
