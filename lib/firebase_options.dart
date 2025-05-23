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
    apiKey: 'AIzaSyDlVADeAMt8y7SSCjEmXEgt9R9vU69ALYc',
    appId: '1:697700472810:web:de5aab2ccc27a3d02e4493',
    messagingSenderId: '697700472810',
    projectId: 'pranav-c1ff0',
    authDomain: 'pranav-c1ff0.firebaseapp.com',
    databaseURL: 'https://pranav-c1ff0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pranav-c1ff0.firebasestorage.app',
    measurementId: 'G-97B2DXVX96',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5mN7nvoXjdaKgS4C7fKQ1ipVs3RIlYis',
    appId: '1:697700472810:android:245074626d6418122e4493',
    messagingSenderId: '697700472810',
    projectId: 'pranav-c1ff0',
    databaseURL: 'https://pranav-c1ff0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pranav-c1ff0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDC99hjh2WHoyejjZPKHTtdPSIDGxiZVI',
    appId: '1:697700472810:ios:68fb7ebf7c4ee4202e4493',
    messagingSenderId: '697700472810',
    projectId: 'pranav-c1ff0',
    databaseURL: 'https://pranav-c1ff0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pranav-c1ff0.firebasestorage.app',
    iosBundleId: 'com.example.pranav',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDC99hjh2WHoyejjZPKHTtdPSIDGxiZVI',
    appId: '1:697700472810:ios:68fb7ebf7c4ee4202e4493',
    messagingSenderId: '697700472810',
    projectId: 'pranav-c1ff0',
    databaseURL: 'https://pranav-c1ff0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pranav-c1ff0.firebasestorage.app',
    iosBundleId: 'com.example.pranav',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDlVADeAMt8y7SSCjEmXEgt9R9vU69ALYc',
    appId: '1:697700472810:web:47727148d91bab532e4493',
    messagingSenderId: '697700472810',
    projectId: 'pranav-c1ff0',
    authDomain: 'pranav-c1ff0.firebaseapp.com',
    databaseURL: 'https://pranav-c1ff0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pranav-c1ff0.firebasestorage.app',
    measurementId: 'G-NE0B7M6WBE',
  );
}
