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
    apiKey: 'AIzaSyDg6XVemecSQV4ti8I3cyIcn7jpoiUG9zA',
    appId: '1:1025622893706:web:2b565ca33700255c4cf973',
    messagingSenderId: '1025622893706',
    projectId: 'apdi-aus',
    authDomain: 'apdi-aus.firebaseapp.com',
    storageBucket: 'apdi-aus.appspot.com',
    measurementId: 'G-00D7GERXTG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9KPFats2bHBcTzKIdpPnvBLcALPj42Rw',
    appId: '1:1025622893706:android:47f13e7af80a95e54cf973',
    messagingSenderId: '1025622893706',
    projectId: 'apdi-aus',
    storageBucket: 'apdi-aus.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCX16FrAB0jkBDLDjN7ukW_dqFm0GnaKkw',
    appId: '1:1025622893706:ios:8e6df03cc38f68e34cf973',
    messagingSenderId: '1025622893706',
    projectId: 'apdi-aus',
    storageBucket: 'apdi-aus.appspot.com',
    iosClientId: '1025622893706-tj2a73imumt8tn1sgaav20o7t8quemeh.apps.googleusercontent.com',
    iosBundleId: 'com.inus.apdi',
  );
}
