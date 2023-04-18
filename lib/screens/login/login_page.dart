import 'package:education_app2/configs/themes/app_colors.dart';
import 'package:education_app2/controllers/auth_controller.dart';
import 'package:education_app2/widgets/common/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  static const String routeName = "/loginPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_splash_logo.png",
              width: 200,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 60,
              ),
              child: const Text(
                "This is a Practice Application named Education App. You can use this App as you want. You have the full access to all the materials in this course.\n\nDevelop by Idham",
                style: TextStyle(
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.5,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),

            //
            MainButton(
              onTap: () {
                //
                //Button SignIn to Google
                controller.signInWithGoogle();
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: SvgPicture.asset(
                      "assets/icons/google.svg",
                    ),
                  ),

                  //
                  Center(
                    child: Text(
                      "Sign in with Google",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
