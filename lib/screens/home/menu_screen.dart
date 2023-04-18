import 'package:education_app2/configs/themes/app_colors.dart';
import 'package:education_app2/configs/themes/ui_parameters.dart';
import 'package:education_app2/controllers/zoom_drawer_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: mainGradient(),
      ),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: onSurfaceTextColor),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toogleDrawer();
                  },
                ),
              ),

              //
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3,
                ),
                child: Column(
                  children: [
                    Obx(
                      () => controller.user.value == null
                          ? SizedBox()
                          : Text(
                              controller.user.value!.displayName ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: onSurfaceTextColor,
                              ),
                            ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),

                    //
                    _DrawerButton(
                      icon: Icons.web,
                      label: "Website",
                      onPressed: () => controller.website(),
                    ),

                    //
                    _DrawerButton(
                      icon: Icons.facebook,
                      label: "Facebook",
                      onPressed: () => controller.facebook(),
                    ),

                    //
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                      ),
                      child: _DrawerButton(
                        icon: Icons.email,
                        label: "Email",
                        onPressed: () => controller.email(),
                      ),
                    ),

                    const Spacer(
                      flex: 4,
                    ),

                    //
                    _DrawerButton(
                      icon: Icons.logout,
                      label: "Logout",
                      onPressed: () => controller.signOut(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 15,
      ),
      label: Text(label),
    );
  }
}
