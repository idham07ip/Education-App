import 'package:education_app2/firebase_ref/references.dart';
import 'package:get/get.dart';

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? namaGambar) async {
    if (namaGambar == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child("question_paper_images")
          .child('${namaGambar.toLowerCase()}.png');
      var urlGambar = await urlRef.getDownloadURL();

      return urlGambar;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
