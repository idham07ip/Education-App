import 'package:education_app2/configs/themes/app_colors.dart';
import 'package:education_app2/configs/themes/custom_text_styles.dart';
import 'package:education_app2/configs/themes/ui_parameters.dart';
import 'package:education_app2/controllers/question_paper/questions_controller.dart';
import 'package:education_app2/firebase_ref/loading_status.dart';
import 'package:education_app2/screens/question/test_overview_screen.dart';
import 'package:education_app2/widgets/common/background_decoration.dart';
import 'package:education_app2/widgets/common/custom_app_bar.dart';
import 'package:education_app2/widgets/common/main_button.dart';
import 'package:education_app2/widgets/common/question_placeholder.dart';
import 'package:education_app2/widgets/content_area.dart';
import 'package:education_app2/widgets/questions/answer_card.dart';
import 'package:education_app2/widgets/questions/countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class QuestionPage extends GetView<QuestionsController> {
  const QuestionPage({super.key});

  static const String routeName = "/questionPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: const ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(
                color: onSurfaceTextColor,
                width: 2,
              ),
            ),
          ),
          child: Obx(
            () => CountdownTimer(
              time: controller.time.value,
              color: onSurfaceTextColor,
            ),
          ),
          // child: Text("Timer"),
        ),
        showActionIcon: true,
        titileWidget: Obx(
          () => Text(
            'Soal ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}',
            style: appBarTS,
          ),
        ),
      ),

      //
      body: BackgroundDecoration(
        child: Obx(
          () => Column(
            children: [
              if (controller.loadingStatus.value == LoadingStatus.loading)
                ContentArea(
                  child: const Expanded(
                    child: QuestionPlaceholder(),
                  ),
                ),
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
                            id: 'answers_list',
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

              //New Widget Next / Previous Questions
              ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: UIParameters.mobileScreenPadding,
                  child: Row(
                    children: [
                      Visibility(
                        visible: controller.isFirstQuestion,
                        child: SizedBox(
                          width: 55,
                          height: 55,
                          child: MainButton(
                            onTap: () {
                              //Previous Question
                              controller.prevQuestion();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Get.isDarkMode
                                  ? onSurfaceTextColor
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),

                      //Calling NextQuestion
                      Expanded(
                        child: Visibility(
                          visible: controller.loadingStatus.value ==
                              LoadingStatus.completed,
                          child: MainButton(
                            onTap: () {
                              //Next page to overview
                              controller.isLastQuestion
                                  ? Get.toNamed(TestOverviewScreen.routeName)
                                  : controller.nextQuestion();
                            },
                            title: controller.isLastQuestion
                                ? 'Complete'
                                : 'Next Question',
                          ),
                        ),
                      ),
                    ],
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
