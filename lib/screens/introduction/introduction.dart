import 'package:education_app2/configs/themes/app_colors.dart';
import 'package:education_app2/controllers/question_paper/question_paper_controller.dart';
import 'package:education_app2/routes/app_routes.dart';
import 'package:education_app2/screens/home/home_screen.dart';
import 'package:education_app2/widgets/app_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppIntroductionSreen extends StatelessWidget {
  const AppIntroductionSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),

        //
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
              ),
              SizedBox(
                height: 40,
              ),

              const Text(
                'This is a study app.\n You can use it as you want, If you understand how it works you would be able to scale it. With this you will master firebase backend and flutter frontend.\n \nDeveloped by Idham.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: onSurfaceTextColor,
                  fontFamily: 'Poppins',
                  fontSize: 16.5,
                  fontWeight: FontWeight.w700,
                ),
              ),

              //
              SizedBox(
                height: 40,
              ),

              //
              AppCircleButton(
                onTap: () => Get.offAndToNamed('/home'),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 35,
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
