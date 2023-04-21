import 'package:education_app2/controllers/question_paper/question_paper_controller.dart';
import 'package:education_app2/controllers/question_paper/questions_controller.dart';
import 'package:education_app2/controllers/zoom_drawer_controller.dart';
import 'package:education_app2/screens/home/home_screen.dart';
import 'package:education_app2/screens/introduction/introduction.dart';
import 'package:education_app2/screens/login/login_page.dart';
import 'package:education_app2/screens/question/question_page.dart';
import 'package:education_app2/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: "/introduction",
          page: () => const AppIntroductionSreen(),
        ),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            },
          ),
        ),
        GetPage(
          name: LoginPage.routeName,
          page: () => LoginPage(),
        ),

        //QuestionPage
        GetPage(
            name: QuestionPage.routeName,
            page: () => QuestionPage(),
            binding: BindingsBuilder(() {
              Get.put(QuestionsController());
            })),
      ];
}
