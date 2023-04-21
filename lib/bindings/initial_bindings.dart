import 'package:education_app2/controllers/auth_controller.dart';
import 'package:education_app2/controllers/theme_controller.dart';
import 'package:education_app2/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    //Get.put(PapersDataUploader());
    Get.put(AuthController(), permanent: true);
    // Get.put(NotificationService());
    Get.lazyPut(() => FirebaseStorageService());
  }
}
