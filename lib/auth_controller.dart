import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reunion/my_home_page.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.offAll(() => MyHomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.');
      } else {
        Get.snackbar(
            'Error', e.message ?? 'An error occurred while signing up.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.offAll(() => MyHomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided for that user.');
      } else {
        Get.snackbar(
            'Error', e.message ?? 'An error occurred while signing in.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
