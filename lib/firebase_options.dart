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
    apiKey: 'AIzaSyATAoTnJci9qdE-BT1BMTOeHbF0Tzkey3w',
    appId: '1:137600164108:web:0e15241de151cadab2e929',
    messagingSenderId: '137600164108',
    projectId: 'pokemon-f3521',
    authDomain: 'pokemon-f3521.firebaseapp.com',
    storageBucket: 'pokemon-f3521.appspot.com',
    measurementId: 'G-4971EMD929',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_eui3sni25YghwE0x3FJj14opjZxws18',
    appId: '1:137600164108:android:abaa9df007238a37b2e929',
    messagingSenderId: '137600164108',
    projectId: 'pokemon-f3521',
    storageBucket: 'pokemon-f3521.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjSEUX_c7ubCBRqObnM1XOJjtsFqS9NNE',
    appId: '1:137600164108:ios:9e4f5e91b849e02eb2e929',
    messagingSenderId: '137600164108',
    projectId: 'pokemon-f3521',
    storageBucket: 'pokemon-f3521.appspot.com',
    iosClientId: '137600164108-t6k2qc9jjt0p8ct0h8b6hkmid864npt1.apps.googleusercontent.com',
    iosBundleId: 'com.example.pokemon',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjSEUX_c7ubCBRqObnM1XOJjtsFqS9NNE',
    appId: '1:137600164108:ios:9e4f5e91b849e02eb2e929',
    messagingSenderId: '137600164108',
    projectId: 'pokemon-f3521',
    storageBucket: 'pokemon-f3521.appspot.com',
    iosClientId: '137600164108-t6k2qc9jjt0p8ct0h8b6hkmid864npt1.apps.googleusercontent.com',
    iosBundleId: 'com.example.pokemon',
  );
}
