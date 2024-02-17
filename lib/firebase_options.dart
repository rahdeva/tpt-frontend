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
    apiKey: "AIzaSyCkC0v1yi16FCSbSqIgQPB3lO5ViLJwomM",
    appId: "1:57783405919:web:43b9ad839cc1f4b10dfaea",
    messagingSenderId: "57783405919",
    projectId: "toko-perlengkapan-ternak",
    authDomain: "toko-perlengkapan-ternak.firebaseapp.com",
    storageBucket: "toko-perlengkapan-ternak.appspot.com",
    measurementId: "G-3N7LE2LXEZ"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpToyl2vIwAw2YDQOvjALim4FAqw7evYU',
    appId: '1:57783405919:android:3d846f6ddddb915b0dfaea',
    messagingSenderId: '57783405919',
    projectId: 'toko-perlengkapan-ternak',
    storageBucket: 'toko-perlengkapan-ternak.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2c926nVFvbWr2P2Zn3aEEfP3s9Nj2njQ',
    appId: '1:57783405919:ios:9532d2ec9def422d0dfaea',
    messagingSenderId: '57783405919',
    projectId: 'toko-perlengkapan-ternak',
    storageBucket: 'toko-perlengkapan-ternak.appspot.com',
    iosBundleId: 'com.rahdeva.tptFrontend',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2c926nVFvbWr2P2Zn3aEEfP3s9Nj2njQ',
    appId: '1:57783405919:ios:88a201b124c364520dfaea',
    messagingSenderId: '57783405919',
    projectId: 'toko-perlengkapan-ternak',
    storageBucket: 'toko-perlengkapan-ternak.appspot.com',
    iosBundleId: 'com.rahdeva.tptFrontend.RunnerTests',
  );
}
