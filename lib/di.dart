import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_game/data/datasources/question_datasource.dart';
import 'package:quiz_game/data/repositories/question_repository.dart';

var locator = GetIt.I;

Future<void> initLocator() async {
  locator.registerSingleton<Dio>(Dio(BaseOptions(
    baseUrl: 'https://opentdb.com/',
    connectTimeout: const Duration(seconds: 5),
  )));

  //datasources
  locator.registerSingleton<QuestionDataSource>(QuestionRemote());

  //repository
  locator.registerSingleton<IQuestionRepository>(QuestionRepository());
}
