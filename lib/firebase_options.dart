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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2XuOLXoKkOWteOR48Ta-xPCb32_zgCgE',
    appId: '1:933756247137:android:3f2f71992881a1d72a1e20',
    messagingSenderId: '933756247137',
    projectId: 'fujipeople-film-recipe',
    storageBucket: 'fujipeople-film-recipe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDphi25K3FC51zCWM-saFdV3vKSYXeGVqg',
    appId: '1:933756247137:ios:b8bc3a7dc4d92d682a1e20',
    messagingSenderId: '933756247137',
    projectId: 'fujipeople-film-recipe',
    storageBucket: 'fujipeople-film-recipe.appspot.com',
    androidClientId: '933756247137-t28jum8ufmjqofr30e09jbp6eejkib88.apps.googleusercontent.com',
    iosClientId: '933756247137-3lscjhue70g18m93mfno8pcv3ofaonrl.apps.googleusercontent.com',
    iosBundleId: 'com.babayo.fujiFilmRecipe',
  );
}
