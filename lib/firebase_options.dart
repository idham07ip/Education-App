// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDBFMnd6N6sqpK3NqV23e9SukmdF72VCN8',
    appId: '1:672617180679:web:fa1b3ee1f2ffed459944a2',
    messagingSenderId: '672617180679',
    projectId: 'education-app-6196c',
    authDomain: 'education-app-6196c.firebaseapp.com',
    storageBucket: 'education-app-6196c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPCHDZjF5mm_7Fakn-C8IN0370E-SrbEE',
    appId: '1:672617180679:android:458cabdfb9f445659944a2',
    messagingSenderId: '672617180679',
    projectId: 'education-app-6196c',
    storageBucket: 'education-app-6196c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVllerZOt1gG0CmiixqEFz_mkGHI6myoQ',
    appId: '1:672617180679:ios:892161cabb3f2e2f9944a2',
    messagingSenderId: '672617180679',
    projectId: 'education-app-6196c',
    storageBucket: 'education-app-6196c.appspot.com',
    iosClientId: '672617180679-2lgrg84iocit77ctcssd02d1dm79pcql.apps.googleusercontent.com',
    iosBundleId: 'com.example.educationApp2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVllerZOt1gG0CmiixqEFz_mkGHI6myoQ',
    appId: '1:672617180679:ios:892161cabb3f2e2f9944a2',
    messagingSenderId: '672617180679',
    projectId: 'education-app-6196c',
    storageBucket: 'education-app-6196c.appspot.com',
    iosClientId: '672617180679-2lgrg84iocit77ctcssd02d1dm79pcql.apps.googleusercontent.com',
    iosBundleId: 'com.example.educationApp2',
  );
}
