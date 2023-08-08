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
    apiKey: 'AIzaSyAPrA9VFZeIIdXqe82LlWxS3oB22HUGSkA',
    appId: '1:42309991239:web:2e04e116efc602ecddea62',
    messagingSenderId: '42309991239',
    projectId: 'qizojobque',
    authDomain: 'qizojobque.firebaseapp.com',
    storageBucket: 'qizojobque.appspot.com',
    measurementId: 'G-FHWY98YN2P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmoiM0VlDvRfinu-1jvtw9HbM9zlbk2Ng',
    appId: '1:42309991239:android:b9a8bb2c1e2aadccddea62',
    messagingSenderId: '42309991239',
    projectId: 'qizojobque',
    storageBucket: 'qizojobque.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZFEbkU7qhn4Owc_D1prgqhQFXmMnbGg4',
    appId: '1:42309991239:ios:0d522a9da417cbc8ddea62',
    messagingSenderId: '42309991239',
    projectId: 'qizojobque',
    storageBucket: 'qizojobque.appspot.com',
    iosClientId: '42309991239-ka2ddb5mmk0olmvqdsmgr9msrbc0kqbq.apps.googleusercontent.com',
    iosBundleId: 'com.qizo.job.que.qizoJobQue',
  );
}
