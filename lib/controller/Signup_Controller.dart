import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_firebase/authentication/login.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool signupLoader = false.obs;

  signupApi() async {
    signupLoader.value = true;
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text,
      );

      Get.snackbar(
        "Signup Successful",
        "Your account has been created successfully.",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.to(const LoginScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Password", 'The password provided is too weak.', backgroundColor: Colors.purple);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Account", 'The account already exists for that email.', backgroundColor: Colors.purple);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      signupLoader.value = false;
    }
  }
}
