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
    apiKey: 'AIzaSyD6QjFn4smTM66EoAf4FMAaSgooZqqYnIM',
    appId: '1:688391498512:web:217f15210983324ae8d395',
    messagingSenderId: '688391498512',
    projectId: 'piorganizer',
    authDomain: 'piorganizer.firebaseapp.com',
    storageBucket: 'piorganizer.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzxIoo_NoT1vs9Uy1xOoNo-adGFmoGhKc',
    appId: '1:688391498512:android:083799dfcd896a1ae8d395',
    messagingSenderId: '688391498512',
    projectId: 'piorganizer',
    storageBucket: 'piorganizer.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASg1WiyePR8nZXANPlSUEIGHaTKpV79FE',
    appId: '1:688391498512:ios:063d91a025692606e8d395',
    messagingSenderId: '688391498512',
    projectId: 'piorganizer',
    storageBucket: 'piorganizer.appspot.com',
    iosClientId: '688391498512-doqgfd5f6veu4gdiii6dcua0iva6u993.apps.googleusercontent.com',
    iosBundleId: 'com.example.pog',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASg1WiyePR8nZXANPlSUEIGHaTKpV79FE',
    appId: '1:688391498512:ios:6a4e14d4eb134bf2e8d395',
    messagingSenderId: '688391498512',
    projectId: 'piorganizer',
    storageBucket: 'piorganizer.appspot.com',
    iosClientId: '688391498512-rvgemrfcl4tf9fe5ans0huntfvbht906.apps.googleusercontent.com',
    iosBundleId: 'com.example.pog.RunnerTests',
  );
}