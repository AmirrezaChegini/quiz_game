import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz_game/pages/home_page/widgets/home_appbar.dart';
import 'package:quiz_game/pages/home_page/widgets/question_item.dart';
import 'package:quiz_game/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SafeArea(
        child: AnimationLimiter(
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: Constants.images.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 700),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: QuestionItem(index: index),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
