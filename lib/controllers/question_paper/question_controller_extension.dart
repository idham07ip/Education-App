import 'package:education_app2/controllers/question_paper/questions_controller.dart';

extension QuestionsControllerExtension on QuestionsController {
  //Correct Questions
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  //Correct Answered Questions
  String get correctAnsweredQuestion {
    return '$correctQuestionCount dari ${allQuestions.length} jawaban yang benar.';
  }

  //Calculate the points
  String get points {
    var points = (correctQuestionCount / allQuestions.length) *
        100 *
        (questionPaperModel.timeSeconds - remainSeconds) /
        questionPaperModel.timeSeconds *
        100;
    return points.toStringAsFixed(2);
  }
}
