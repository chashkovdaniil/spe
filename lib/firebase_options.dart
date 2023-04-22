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
    apiKey: 'AIzaSyC39AJ-sAGCgzCNmb5C_5qZPs4FM_AAmJc',
    appId: '1:91199716034:web:441dd521fb50eb1135195b',
    messagingSenderId: '91199716034',
    projectId: 'spe-app-382510',
    authDomain: 'spe-app-382510.firebaseapp.com',
    storageBucket: 'spe-app-382510.appspot.com',
    measurementId: 'G-GR3XXY8420',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVDiyHSk8je9OCkwXMsZWVFTQcqS5M01c',
    appId: '1:91199716034:android:80b604c61e3fc51d35195b',
    messagingSenderId: '91199716034',
    projectId: 'spe-app-382510',
    storageBucket: 'spe-app-382510.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDnB4wqr7ScJ5MA0iZBL1aaA-8iWvZVeDo',
    appId: '1:91199716034:ios:0b574233ffe6cef435195b',
    messagingSenderId: '91199716034',
    projectId: 'spe-app-382510',
    storageBucket: 'spe-app-382510.appspot.com',
    iosClientId: '91199716034-kkaqvbl9nub8b7vbcrspvasg95umvmn8.apps.googleusercontent.com',
    iosBundleId: 'com.tyumgu.spe.spe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDnB4wqr7ScJ5MA0iZBL1aaA-8iWvZVeDo',
    appId: '1:91199716034:ios:0b574233ffe6cef435195b',
    messagingSenderId: '91199716034',
    projectId: 'spe-app-382510',
    storageBucket: 'spe-app-382510.appspot.com',
    iosClientId: '91199716034-kkaqvbl9nub8b7vbcrspvasg95umvmn8.apps.googleusercontent.com',
    iosBundleId: 'com.tyumgu.spe.spe',
  );
}