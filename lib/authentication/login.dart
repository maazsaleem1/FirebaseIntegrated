import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_firebase/controller/Login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginConttroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(
          child: Text(
            ' Login Form ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: loginController.emailController.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                hintText: "Email",
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black54,
                  ),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: loginController.passwordController.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password),
                hintText: "Password",
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black54,
                  ),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Obx(() {
            return GestureDetector(
              onTap: () {
                loginController.loginApi();
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: loginController.loginLoader.value
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
