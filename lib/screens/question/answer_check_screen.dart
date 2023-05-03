import 'package:education_app2/configs/themes/custom_text_styles.dart';
import 'package:education_app2/controllers/question_paper/questions_controller.dart';
import 'package:education_app2/screens/question/result_screen.dart';
import 'package:education_app2/widgets/common/background_decoration.dart';
import 'package:education_app2/widgets/common/custom_app_bar.dart';
import 'package:education_app2/widgets/content_area.dart';
import 'package:education_app2/widgets/questions/answer_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({super.key});

  static const String routeName = "/answerCheckScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titileWidget: Obx(
          () => Text(
            'Soal ke ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
            style: appBarTS,
          ),
        ),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
      ),

      //
      body: BackgroundDecoration(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: ContentArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Column(
                      children: [
                        Text(
                          controller.currentQuestion.value!.question,
                          style: TextStyle(
                            fontSize: 17.5,
                          ),
                        ),

                        //
                        GetBuilder<QuestionsController>(
                          id: 'answer_review_list',
                          builder: (_) {
                            return ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (_, index) {
                                  final answer = controller
                                      .currentQuestion.value!.answers[index];

                                  final selectedAnswer = controller
                                      .currentQuestion.value!.selectedAnswer;

                                  final correctAnswer = controller
                                      .currentQuestion.value!.correctAnswer;

                                  final String answerText =
                                      '${answer.identifier}. ${answer.answer}';

                                  //compare the answers
                                  if (correctAnswer == selectedAnswer &&
                                      answer.identifier == selectedAnswer) {
                                    //correct Answer
                                    return CorrectAnswer(answer: answerText);

                                    //
                                  } else if (selectedAnswer == null) {
                                    //not Selected Answer
                                    return NotAnswer(
                                      answer: answerText,
                                    );

                                    //
                                  } else if (correctAnswer != selectedAnswer &&
                                      answer.identifier == selectedAnswer) {
                                    //Wrong Answers
                                    return WrongAnswer(
                                      answer: answerText,
                                    );

                                    //
                                  } else if (correctAnswer ==
                                      answer.identifier) {
                                    //Correct Answers
                                    return CorrectAnswer(answer: answerText);
                                  }

                                  //
                                  return AnswerCard(
                                    answer: answerText,
                                    onTap: () {},
                                    isSelected: false,
                                  );
                                },
                                separatorBuilder: (_, index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                                itemCount: controller
                                    .currentQuestion.value!.answers.length);
                          },
                        ),
                      ],
                    ),
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
