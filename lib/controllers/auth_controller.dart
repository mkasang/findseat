import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genielogiciel/pages/home_screen.dart';
import 'package:genielogiciel/pages/login_screen.dart';
import 'package:genielogiciel/utils/theme.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthController instance = Get.find();
  late Rx<User?> _user;

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, LoginRedirect);
  }

  LoginRedirect(User? user) {
    Timer(const Duration(seconds: 2), () {
      if (user == null) {
        Get.offAll(() => const LoginScreen());
      } else {
        Get.offAll(() => const HomeScreen());
      }
    });
  }

  void registerUser(email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      //define error
    }
  }

  getErrorSnackBar(String message, _) {
    Get.snackbar(
      "Error",
      "$message\n${_.message}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: MyTheme.redBorder,
      colorText: Colors.white,
      borderRadius: 10.0,
      margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
    );
  }
}
