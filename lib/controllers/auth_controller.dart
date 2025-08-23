import 'dart:developer';

import 'package:app_bong_da/core/di/common_features.dart';
import 'package:app_bong_da/core/network/api_service.dart';
import 'package:app_bong_da/data/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final apiService = getIt<ApiService>();
  Future<void> login() async {
    User user = User(
      email: emailController.text,
      password: passwordController.text,
    );
    try {
      var res = await apiService.login(user);
      if (res.success) {
        log('Login success: ${res.data}');
      } else {
        log('Login failed: ${res.message}');
      }
    } catch (e) {
      log('Login error: $e');
    }
  }
}
