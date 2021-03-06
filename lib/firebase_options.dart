// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDy4E4Gxvee9hkhZFXJztd9jwEOknbnkzo',
    appId: '1:179097108889:android:43ad91fc8a5bb7fc315308',
    messagingSenderId: '179097108889',
    projectId: 'shop-n-thrive',
    storageBucket: 'shop-n-thrive.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyyn7TR4HBW_0uGFGjl4--Yyb1_TgTx4c',
    appId: '1:179097108889:ios:b82e86a4a329ec70315308',
    messagingSenderId: '179097108889',
    projectId: 'shop-n-thrive',
    storageBucket: 'shop-n-thrive.appspot.com',
    iosClientId: '179097108889-ulvd2enfqq1lbq62orm7pel6fl821eat.apps.googleusercontent.com',
    iosBundleId: 'com.bettilina.shopnthrive',
  );
}
