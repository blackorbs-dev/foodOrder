import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB-kuWG3aXeKSkgIks9z_32z1WcG1q0pzk",
            authDomain: "foodorder-d1894.firebaseapp.com",
            projectId: "foodorder-d1894",
            storageBucket: "foodorder-d1894.firebasestorage.app",
            messagingSenderId: "6422119196",
            appId: "1:6422119196:web:9d6a97e8bff045a5c230d9",
            measurementId: "G-YG5TX11H2N"));
  } else {
    await Firebase.initializeApp();
  }
}
