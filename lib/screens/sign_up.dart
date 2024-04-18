import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reunion/controller/auth_controller.dart';
import 'package:reunion/screens/sign_in.dart';
import 'package:reunion/widgets/Reuseable.dart';

class SignUp extends StatelessWidget {
  final AuthController authController = Get.find();

  final TextEditingController nameController = TextEditingController();
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
                'SIGN UP',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.011,
              ),
              const Text(
                'Looks like you don’t have an account. Let’s create a new account for you.',
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
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        filled: true,
                        fillColor: Color.fromARGB(255, 246, 245, 245),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: screenHeight * 0.021,
                    ),
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
                        if (_formKey.currentState!.validate()) {
                          String name = nameController.text.trim();
                          String email = emailController.text.trim();
                          String password = passwordController.text.trim();
                          authController.signUpWithEmailAndPassword(
                              email, password);
                        }
                      },
                      child: Container(
                        height: screenHeight * 0.07,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Center(
                          child: Text(
                            "CREATE ACCOUNT",
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
                            'Already have an account?',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => SignIn());
                            },
                            child: const Text(
                              "Sign-in",
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
