import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reunion/controller/auth_controller.dart';
import 'package:reunion/screens/sign_up.dart';

import 'package:reunion/widgets/Reuseable.dart'; // Assuming ReusableButton is in ReusableButton.dart

class SignIn extends StatelessWidget {
  final AuthController authController = Get.find();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(18, screenHeight * 0.10, 18, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'REUNION',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: screenHeight * 0.022,
              ),
              const Text(
                'SIGN IN',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.011,
              ),
              const Text(
                'Please enter your credentials to continue',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: screenHeight * 0.021,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        filled: true,
                        fillColor: Color.fromARGB(255, 246, 245, 245),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: screenHeight * 0.021,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "* * * * * *",
                        labelText: "Password",
                        suffixIcon: Icon(Icons.visibility),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        filled: true,
                        fillColor: Color.fromARGB(255, 246, 245, 245),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: screenHeight * 0.029,
                    ),
                    InkWell(
                      onTap: () {
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        if (email.isNotEmpty && password.isNotEmpty) {
                          authController.signInWithEmailAndPassword(
                              email, password);
                        } else {
                          Get.snackbar('Error', 'Please fill in all fields.');
                        }
                      },
                      child: Container(
                        height: screenHeight * 0.07,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF2c8485),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.029,
                    ),
                    const Row(children: <Widget>[
                      Expanded(child: Divider()),
                      Text("OR"),
                      Expanded(child: Divider()),
                    ]),
                    SizedBox(
                      height: screenHeight * 0.029,
                    ),
                    ReusableButton(
                      title: "Continue with Google",
                      onTap: () {
                        authController.authenticateWithGoogle(context: context);
                      },
                      imageProvider: AssetImage('assets/google.png'),
                    ),
                    SizedBox(
                      height: screenHeight * 0.011,
                    ),
                    ReusableButton(
                      title: "Continue with Apple",
                      onTap: () {},
                      imageProvider: AssetImage('assets/apple.png'),
                    ),
                    SizedBox(
                      height: screenHeight * 0.011,
                    ),
                    ReusableButton(
                      title: "Continue with Facebook",
                      onTap: () {},
                      imageProvider: AssetImage('assets/facebook.png'),
                    ),
                    SizedBox(
                      height: screenHeight * 0.011,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Dont have an account?',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => SignUp());
                            },
                            child: const Text(
                              "Sign-up",
                              style: TextStyle(
                                  color: Color(0xFF2c8485), fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
