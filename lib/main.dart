import 'package:education_app2/bindings/initial_bindings.dart';
import 'package:education_app2/configs/themes/app_dark_theme.dart';
import 'package:education_app2/configs/themes/app_light_theme.dart';
import 'package:education_app2/controllers/theme_controller.dart';
import 'package:education_app2/data_uploader_screen.dart';
import 'package:education_app2/routes/app_routes.dart';
import 'package:education_app2/screens/introduction/introduction.dart';
import 'package:education_app2/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().temaCerah,
      getPages: AppRoute.routes(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DataUploaderScreen(),
//     ),
//   );
// }
