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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBIXLvmSyzDeGicxLSmpuD410_ktGxn81A',
    appId: '1:12810060409:web:2e0b35ee6b02da9dca8aa8',
    messagingSenderId: '12810060409',
    projectId: 'fir-processes-87f37',
    authDomain: 'fir-processes-87f37.firebaseapp.com',
    storageBucket: 'fir-processes-87f37.appspot.com',
    measurementId: 'G-N2E5GX1HGG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBChXMLsZ7hunOhusnQCgyQTIbgE343OtA',
    appId: '1:12810060409:android:804351238a410635ca8aa8',
    messagingSenderId: '12810060409',
    projectId: 'fir-processes-87f37',
    storageBucket: 'fir-processes-87f37.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiYe1HY1BN6Gue6KYPVYCdRXVBrrPUFOU',
    appId: '1:12810060409:ios:a47b8596eeada552ca8aa8',
    messagingSenderId: '12810060409',
    projectId: 'fir-processes-87f37',
    storageBucket: 'fir-processes-87f37.appspot.com',
    iosBundleId: 'com.example.copyFirebaseProcess',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCiYe1HY1BN6Gue6KYPVYCdRXVBrrPUFOU',
    appId: '1:12810060409:ios:a47b8596eeada552ca8aa8',
    messagingSenderId: '12810060409',
    projectId: 'fir-processes-87f37',
    storageBucket: 'fir-processes-87f37.appspot.com',
    iosBundleId: 'com.example.copyFirebaseProcess',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBIXLvmSyzDeGicxLSmpuD410_ktGxn81A',
    appId: '1:12810060409:web:25673290da0729f2ca8aa8',
    messagingSenderId: '12810060409',
    projectId: 'fir-processes-87f37',
    authDomain: 'fir-processes-87f37.firebaseapp.com',
    storageBucket: 'fir-processes-87f37.appspot.com',
    measurementId: 'G-0T92765169',
  );
}
