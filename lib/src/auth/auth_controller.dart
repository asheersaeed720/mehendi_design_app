import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mehendi_design_app/src/auth/auth_service.dart';
import 'package:mehendi_design_app/src/auth/get_started_screen.dart';
import 'package:mehendi_design_app/src/main_screen.dart';
import 'package:mehendi_design_app/utils/display_toast_message.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  bool isObscure = true;
  bool isAuth = false;

  @override
  void onReady() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
        isAuth = false;
        Get.offAllNamed(GetStartedScreen.routeName);
      } else {
        log('User is signed in!');
        isAuth = true;
        Get.offAllNamed(MainScreen.routeName);
      }
    });
    super.onReady();
  }

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  Future<void> handleGoogleLogIn() async {
    try {
      UserCredential userCredential = await _authService.signInWithGoogle();
      if (userCredential.user != null) {
        displayToastMessage('Logged In');
      }
    } on dio.DioException catch (e) {
      log('$e', name: 'Dio Log In Error');
      // If wifi or data is not enable
      if (e.response == null) {
        displayToastMessage('Network error');
      } else {
        displayToastMessage('Invalid Credentials');
      }
    } on SocketException catch (e) {
      log(e.message, name: 'Dio Internet Log In Error');
      displayToastMessage('Network error');
    } catch (e) {
      log('$e', name: 'Log In Error');
    }
  }

  Future<void> logOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log('$e', name: 'Logout Error');
    }
  }
}
