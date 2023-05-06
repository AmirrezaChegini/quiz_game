import 'dart:async';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quiz_game/bloc/question/question_bloc.dart';
import 'package:quiz_game/bloc/question/question_event.dart';
import 'package:quiz_game/bloc/question/question_state.dart';
import 'package:quiz_game/cubit/answers_cubit.dart';
import 'package:quiz_game/cubit/question_page_cubit.dart';
import 'package:quiz_game/data/models/question.dart';
import 'package:quiz_game/pages/question_page/widgets/answer_list.dart';
import 'package:quiz_game/pages/question_page/widgets/header_info.dart';
import 'package:quiz_game/pages/question_page/widgets/submit_btn.dart';
import 'package:quiz_game/pages/result_page/result_page.dart';
import 'package:quiz_game/utils/my_color.dart';
import 'package:quiz_game/utils/snackbar.dart';
import 'package:quiz_game/widgets/app_bar.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({
    super.key,
    required this.category,
    required this.difficulty,
  });

  final String category;
  final String difficulty;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  Timer? timer;
  Duration? duration;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<QUestionPageCubit>(context).resetQuestion();
    BlocProvider.of<AnswersCubit>(context).resetAnswers();
    BlocProvider.of<AnswersCubit>(context).resetIndex();
    BlocProvider.of<QuestionBloc>(context).add(QuestionEvent(
      category: widget.category,
      difficulty: widget.difficulty,
    ));

    if (widget.difficulty == 'Easy') {
      duration = const Duration(minutes: 3);
    } else if (widget.difficulty == 'Medium') {
      duration = const Duration(minutes: 2);
    } else {
      duration = const Duration(minutes: 1);
    }
  }

  @override
  void dispose() {
    super.dispose();
    stopTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    timer?.cancel();
  }

  //timer countdown -1 second
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = duration!.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        timer?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ResultPage()),
        );
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.category,
      ),
      body: SafeArea(
        child: BlocConsumer<QuestionBloc, QuestionState>(
          builder: (context, state) {
            if (state is InitQuestionState) {
              return const Center(
                child: SpinKitThreeBounce(
                  color: MyColor.gray,
                  size: 30,
                ),
              );
            }
            if (state is ErrorQuestionState) {
              return const SizedBox();
            }
            if (state is CompletedQuestionState) {
              return OrientationBuilder(
                builder: (context, orientation) =>
                    orientation == Orientation.portrait
                        ? PortraitMode(
                            duration: duration!,
                            questionList: state.questionList)
                        : LandScapeMod(
                            duration: duration!,
                            questionList: state.questionList),
              );
            }
            return const SizedBox();
          },
          listener: (context, state) {
            if (state is ErrorQuestionState) {
              showMessage(
                state.errorMessage,
                context,
                () {
                  BlocProvider.of<QuestionBloc>(context).add(QuestionEvent(
                    category: widget.category,
                    difficulty: widget.difficulty,
                  ));
                },
              );
            }
            if (state is CompletedQuestionState) {
              startTimer();
            }
          },
        ),
      ),
    );
  }
}

class LandScapeMod extends StatelessWidget {
  const LandScapeMod({
    super.key,
    required this.duration,
    required this.questionList,
  });
  final Duration duration;
  final List<Question> questionList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DelayedWidget(
        child: BlocBuilder<QUestionPageCubit, int>(
          builder: (context, state) => Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    HeaderInfo(duration: duration, length: questionList.length),
                    const Divider(
                      color: MyColor.gray,
                      thickness: 1,
                    ),
                    Text(
                      questionList[state].question,
                      style: const TextStyle(
                        fontFamily: 'pop-regular',
                        fontSize: 20,
                        color: MyColor.gray,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AnswerList(answers: questionList[state].allAnswers!),
                      const SizedBox(height: 20),
                      SubmitBtn(
                        length: questionList.length,
                        correctAnswer: questionList[state].correctAnswer,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PortraitMode extends StatelessWidget {
  const PortraitMode({
    super.key,
    required this.duration,
    required this.questionList,
  });
  final Duration duration;
  final List<Question> questionList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DelayedWidget(
        child: BlocBuilder<QUestionPageCubit, int>(
          builder: (context, state) => Column(
            children: [
              const Spacer(),
              HeaderInfo(
                duration: duration,
                length: questionList.length,
              ),
              const Divider(
                color: MyColor.gray,
                thickness: 1,
              ),
              const SizedBox(height: 10),
              Text(
                questionList[state].question,
                style: const TextStyle(
                  fontFamily: 'pop-regular',
                  fontSize: 20,
                  color: MyColor.gray,
                ),
              ),
              const Spacer(),
              AnswerList(answers: questionList[state].allAnswers!),
              const Spacer(),
              SubmitBtn(
                length: questionList.length,
                correctAnswer: questionList[state].correctAnswer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
