class Question {
  String _question;
  String _correctAnswer;
  List _incorrectAnswers;
  String _difficulty;
  List? allAnswers;

  Question(
    this._question,
    this._correctAnswer,
    this._incorrectAnswers,
    this._difficulty,
  ) {
    //create list of alla answers and shuffle it
    allAnswers = [...incorrectAnswers, correctAnswer];
    allAnswers!.shuffle();
  }

  factory Question.fromMapJson(Map<String, dynamic> jsonObject) {
    return Question(
      jsonObject['question'],
      jsonObject['correct_answer'],
      jsonObject['incorrect_answers'],
      jsonObject['difficulty'],
    );
  }

  String get question => _question;
  String get correctAnswer => _correctAnswer;
  List get incorrectAnswers => _incorrectAnswers;
  String get difficulty => _difficulty;
}
