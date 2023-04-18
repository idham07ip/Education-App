import 'package:education_app2/configs/themes/app_colors.dart';
import 'package:education_app2/configs/themes/app_light_theme.dart';
import 'package:education_app2/configs/themes/custom_text_styles.dart';
import 'package:education_app2/configs/themes/ui_parameters.dart';
import 'package:education_app2/controllers/question_paper/question_paper_controller.dart';
import 'package:education_app2/controllers/zoom_drawer_controller.dart';
import 'package:education_app2/screens/home/menu_screen.dart';
import 'package:education_app2/screens/home/question_card.dart';
import 'package:education_app2/widgets/app_circle_button.dart';
import 'package:education_app2/widgets/app_icons.dart';
import 'package:education_app2/widgets/content_area.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();

    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_) {
        //
        return ZoomDrawer(
          borderRadius: 50.0,
          controller: _.zoomDrawerController,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.DefaultStyle,

          backgroundColor: Colors.white.withOpacity(0.5),
          slideWidth: MediaQuery.of(context).size.width * 0.6,
          menuScreen: MyMenuScreen(),

          //
          mainScreen: Container(
            decoration: BoxDecoration(
              gradient: mainGradient(),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  Padding(
                    padding: EdgeInsets.all(
                      mobileScreenPadding,
                    ),

                    //
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(
                          child: const Icon(
                            AppIcons.menuLeft,
                          ),
                          onTap: controller.toogleDrawer,
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        //
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(
                                AppIcons.peace,
                              ),
                              Text(
                                "Hello Friend",
                                style: detailText.copyWith(
                                  color: onSurfaceTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "What do you want to learn today?",
                          style: headerText,
                        ),
                      ],
                    ),
                  ),

                  //
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(
                          () => ListView.separated(
                              padding: UIParameters.mobileScreenPadding,
                              itemBuilder: (BuildContext contex, int index) {
                                return QuestionCard(
                                  model: _questionPaperController
                                      .semuaSoalModel[index],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext contex, int index) {
                                return SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount: _questionPaperController
                                  .semuaSoalModel.length),
                        ),
                      ),
                    ),
                  ),

                  //
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
