import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:quiz_game/pages/difficulty_page/widgets/difficulty_item.dart';
import 'package:quiz_game/widgets/app_bar.dart';

class DifficultyPage extends StatelessWidget {
  const DifficultyPage({
    super.key,
    required this.title,
    required this.image,
    required this.icon,
  });

  final String title;
  final String icon;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) => orientation == Orientation.portrait
              ? PortraitMode(
                  image: image,
                  title: title,
                )
              : LandScapeMode(
                  image: image,
                  title: title,
                ),
        ),
      ),
    );
  }
}

class LandScapeMode extends StatelessWidget {
  const LandScapeMode({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: DelayedWidget(child: Image.asset(image)),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              ...List.generate(
                3,
                (index) => Expanded(
                    child: DelayedWidget(
                  delayDuration: Duration(milliseconds: (index * 300) + 300),
                  child: DifficultyItem(
                    index: index,
                    title: title,
                  ),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PortraitMode extends StatelessWidget {
  const PortraitMode({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: DelayedWidget(
              child: Image.asset(image),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              ...List.generate(
                3,
                (index) => DelayedWidget(
                  delayDuration: Duration(milliseconds: (index * 300) + 300),
                  child: DifficultyItem(
                    index: index,
                    title: title,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
