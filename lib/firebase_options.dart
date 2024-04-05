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
    apiKey: 'AIzaSyCCSZMjdoJPss9-LizvKs1EmmYwL7AhKTU',
    appId: '1:182029040846:web:db3d1ee486919f804ba49f',
    messagingSenderId: '182029040846',
    projectId: 'flutter-notes-co21315',
    authDomain: 'flutter-notes-co21315.firebaseapp.com',
    storageBucket: 'flutter-notes-co21315.appspot.com',
    measurementId: 'G-HFL32WRQQ0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqCf1v3qUVl6kp8nHbF9OQ_Vp7jozubpg',
    appId: '1:182029040846:android:6049622596978d114ba49f',
    messagingSenderId: '182029040846',
    projectId: 'flutter-notes-co21315',
    storageBucket: 'flutter-notes-co21315.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNwPSdvsr48zAvdbZsXAhsnxYb6EzxOFc',
    appId: '1:182029040846:ios:2a02f5a782c9b7404ba49f',
    messagingSenderId: '182029040846',
    projectId: 'flutter-notes-co21315',
    storageBucket: 'flutter-notes-co21315.appspot.com',
    iosBundleId: 'com.makingstuffup.notesflutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNwPSdvsr48zAvdbZsXAhsnxYb6EzxOFc',
    appId: '1:182029040846:ios:e96388fabab22c114ba49f',
    messagingSenderId: '182029040846',
    projectId: 'flutter-notes-co21315',
    storageBucket: 'flutter-notes-co21315.appspot.com',
    iosBundleId: 'com.makingstuffup.notesflutter.RunnerTests',
  );
}
