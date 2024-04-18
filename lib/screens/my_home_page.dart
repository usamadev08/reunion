import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reunion/controller/auth_controller.dart';

class MyHomePage extends StatelessWidget {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Obx(() {
          User? user = authController.currentUser.value;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user != null ? "Welcome, ${user.email}" : "Welcome",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  authController.signOut();
                },
                child: Text("Sign-Out"),
              ),
            ],
          );
        }),
      ),
    );
  }
}
