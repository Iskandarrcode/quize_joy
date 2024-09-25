// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCGHqHQu2bTjzSZum4-jEBikTzy4DW5K8Q',
    appId: '1:519409556384:web:1571cc64cf9aa56867e2c5',
    messagingSenderId: '519409556384',
    projectId: 'question-app-f507c',
    authDomain: 'question-app-f507c.firebaseapp.com',
    storageBucket: 'question-app-f507c.appspot.com',
    measurementId: 'G-EGGEVVP7VC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsXohqru91tmzVN8Fa5xxmvbKNvm60pB4',
    appId: '1:519409556384:android:3a6898af258b86b767e2c5',
    messagingSenderId: '519409556384',
    projectId: 'question-app-f507c',
    storageBucket: 'question-app-f507c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCaiWZeIGsRpI42XhHSKEunjzw411sjik4',
    appId: '1:519409556384:ios:8ce2f8fa16b4a29e67e2c5',
    messagingSenderId: '519409556384',
    projectId: 'question-app-f507c',
    storageBucket: 'question-app-f507c.appspot.com',
    iosBundleId: 'com.example.quizeJoy',
  );
}