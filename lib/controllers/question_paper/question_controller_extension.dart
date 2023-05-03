import 'package:education_app2/controllers/auth_controller.dart';
import 'package:education_app2/controllers/question_paper/questions_controller.dart';
import 'package:education_app2/firebase_ref/references.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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

  //save question result
  Future<void> saveTestResult() async {
    var batch = fireStore.batch();
    User? _user = Get.find<AuthController>().getUser();
    if (_user == null) return;
    batch.set(
        userRF
            .doc(_user.email)
            .collection('myRecentTestQuestions')
            .doc(questionPaperModel.id),
        {
          "points": points,
          "correct_answer": '$correctQuestionCount/${allQuestions.length}',
          "question_id": questionPaperModel.id,
          'time': questionPaperModel.timeSeconds - remainSeconds
        });
    batch.commit();
    navigateToHome();
  }
}
