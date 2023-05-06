import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/bloc/question/question_bloc.dart';
import 'package:quiz_game/cubit/answers_cubit.dart';
import 'package:quiz_game/cubit/question_page_cubit.dart';
import 'package:quiz_game/di.dart';
import 'package:quiz_game/pages/home_page/home_page.dart';
import 'package:quiz_game/utils/my_color.dart';

void main() async {
  await initLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => QuestionBloc()),
        BlocProvider(create: (context) => QUestionPageCubit()),
        BlocProvider(create: (context) => AnswersCubit()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColor.blue900,
      ),
      home: const HomePage(),
    );
  }
}
