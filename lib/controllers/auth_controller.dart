import 'package:education_app2/firebase_ref/references.dart';
import 'package:education_app2/screens/home/home_screen.dart';
import 'package:education_app2/screens/login/login_page.dart';
import 'package:education_app2/utils/app_logger.dart';
import 'package:education_app2/widgets/dialogs/dialogue_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;

  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  //Sign in to Google Controller method
  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
          idToken: _authAccount.idToken,
          accessToken: _authAccount.accessToken,
        );

        await _auth.signInWithCredential(_credential);
        await saveUser(account);
        navigateToHomePage();
      }
    } on Exception catch (error) {
      AppLogger.e(error);
    }
  }

  //Method getUser
  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl,
    });
  }

  //Sign Out
  Future<void> signOut() async {
    AppLogger.d('Sign Out');
    try {
      await _auth.signOut();
      navigateToHomePage();
      // print("Goodbye");
    } on FirebaseAuthException catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  //
  navigateToHomePage() {
    Get.offAllNamed(HomeScreen.routeName);
  }

  void showLoginAlertDialogue() {
    Get.dialog(
      Dialogs.questionStartDialog(
        onTap: () {
          Get.back();
          navigateToLoginPage();
        },
      ),
      barrierDismissible: false,
    );
  }

  void navigateToLoginPage() {
    Get.toNamed(LoginPage.routeName);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
