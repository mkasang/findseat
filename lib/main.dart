import 'package:flutter/material.dart';
import 'package:genielogiciel/firebase_options.dart';
import 'package:genielogiciel/pages/splash_screen.dart';
import 'package:genielogiciel/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:genielogiciel/controllers/auth_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.myLightTheme,
      home: const SpashScreen(),
    );
  }
}
