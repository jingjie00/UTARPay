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
    apiKey: 'AIzaSyCnfDZ5N9xNl8yLvWMC1Dy97MflxWp_aZI',
    appId: '1:542160672332:web:bb7510325c89f3c83106e9',
    messagingSenderId: '542160672332',
    projectId: 'utar-pay',
    authDomain: 'utar-pay.firebaseapp.com',
    storageBucket: 'utar-pay.appspot.com',
    measurementId: 'G-68K1C8J69E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWk_HbxtyYGxNMEboEQwsGWgj56ZAUMsE',
    appId: '1:542160672332:android:3803422c332ac4663106e9',
    messagingSenderId: '542160672332',
    projectId: 'utar-pay',
    storageBucket: 'utar-pay.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD48_vtt1fCNEEkXqWnsGolP0jGUw78ECM',
    appId: '1:542160672332:ios:7292ff43d169f1b33106e9',
    messagingSenderId: '542160672332',
    projectId: 'utar-pay',
    storageBucket: 'utar-pay.appspot.com',
    iosBundleId: 'com.jingjietan.utarpay',
  );
}
