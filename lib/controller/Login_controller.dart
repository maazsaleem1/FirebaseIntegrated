import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginConttroller extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loginLoader = false.obs;

  loginApi() async {
    loginLoader.value = true;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text,
      );

      Get.snackbar(
        "Login Successful",
        "",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("User", 'No user found for that email', backgroundColor: Colors.purple);
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Password", 'Wrong password provided for that user.', backgroundColor: Colors.purple);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      loginLoader.value = false;
    }
  }
}
