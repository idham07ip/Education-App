import 'package:education_app2/configs/themes/custom_text_styles.dart';
import 'package:education_app2/controllers/question_paper/questions_controller.dart';
import 'package:education_app2/firebase_ref/loading_status.dart';
import 'package:education_app2/widgets/common/background_decoration.dart';
import 'package:education_app2/widgets/common/question_placeholder.dart';
import 'package:education_app2/widgets/content_area.dart';
import 'package:education_app2/widgets/questions/answer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class QuestionPage extends GetView<QuestionsController> {
  const QuestionPage({super.key});

  static const String routeName = "/questionPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Obx(
          () => Column(
            children: [
              if (controller.loadingStatus.value == LoadingStatus.loading)
                ContentArea(
                    child: const Expanded(child: QuestionPlaceholder())),
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                  child: ContentArea(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        top: 25,
                      ),
                      child: Column(
                        children: [
                          Text(
                            controller.currentQuestion.value!.question,
                            style: questionTS,
                          ),
                          GetBuilder<QuestionsController>(
                            builder: (context) {
                              return ListView.separated(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                    top: 25,
                                  ),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final answer = controller
                                        .currentQuestion.value!.answers[index];

                                    //
                                    return AnswerCard(
                                      answer:
                                          '${answer.identifier}.${answer.answer}',
                                      onTap: () {
                                        controller
                                            .selectedAnswer(answer.identifier);
                                      },
                                      isSelected: answer.identifier ==
                                          controller.currentQuestion.value!
                                              .selectedAnswer,
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(
                                            height: 10,
                                          ),
                                  itemCount: controller
                                      .currentQuestion.value!.answers.length);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
