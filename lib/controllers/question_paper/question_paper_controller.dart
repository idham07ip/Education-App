import 'package:education_app2/controllers/auth_controller.dart';
import 'package:education_app2/firebase_ref/references.dart';
import 'package:education_app2/models/question_paper_model.dart';
import 'package:education_app2/screens/question/question_page.dart';
import 'package:education_app2/services/firebase_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app2/utils/app_logger.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final semuaSoalGambar = <String>[].obs;

  final semuaSoalModel = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getSemuaSoal();
    super.onReady();
  }

  Future<void> getSemuaSoal() async {
    List<String> namaGambar = ["biology", "chemistry", "maths", "physics"];

    try {
      //Load Semua Soal
      QuerySnapshot<Map<String, dynamic>> data =
          await questionPaperReferences.get();

      final listKertas = data.docs
          .map((Kertas) => QuestionPaperModel.fromSnapShot(Kertas))
          .toList();
      semuaSoalModel.assignAll(listKertas);

      //
      //Load Semua Gambar
      for (var Kertas in listKertas) {
        final urlGambar =
            await Get.find<FirebaseStorageService>().getImage(Kertas.title);
        // semuaSoalGambar.add(urlGambar!);

        //assign a value
        Kertas.imageUrl = urlGambar;
      }
      semuaSoalModel.assignAll(listKertas);
    } catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToQuestionScreen(
      {required QuestionPaperModel kertas, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        // Get.offNamed(page)
      } else {
        // print("Sudah Login");

        //Route to QuestionPage with GetX
        Get.toNamed(QuestionPage.routeName, arguments: kertas);
      }
    } else {
      // print('The title Question is ${kertas.title}');
      _authController.showLoginAlertDialogue();
    }
  }
}
