import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yo_event/views/splash_screen.dart';
import 'package:firebase_storage_web/firebase_storage_web.dart';

void main() async {
  GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '472628794772-ftc836cu8cf7b93t0g7cpqsq27cpbu2s.apps.googleusercontent.com');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA9YL-GFElLl--Ag311hR8NEEqGvHYPheU",
          projectId: "yoevent-500d7",
          messagingSenderId: "472628794772",
          appId: "1:472628794772:web:8751b605c3d84fa5ee2b81"));

  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: splashpage(),
      ),
    );
  }
}
