import 'dart:developer';

import 'package:app_bong_da/core/di/common_features.dart';
import 'package:app_bong_da/core/network/api_service.dart';
import 'package:app_bong_da/data/models/login_model.dart';
import 'package:app_bong_da/data/storage/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<String> message = "".obs;

  final apiService = getIt<ApiService>();
  Future<bool> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      message.value = "Please enter all required information.";
      return false;
    }
    if (password.length <= 6) {
      message.value = "Password required bigger than 6 character";
      return false;
    }
    User user = User(
      email: email,
      password: password,
    );
    try {
      var res = await apiService.login(user);
      log("$res");
      if (res.success) {
        log('Login success: ${res.data}');
        await UserStorage.saveToken(res.data!.token ?? "");
        log('Token: ${res.data!.token}');
        await UserStorage.saveUserId(res.data!.user?.id ?? "");
        log("Id User: ${res.data!.user?.id}");
        return true;
      } else {
        log('Login failed: ${res.message}');
        return false;
      }
    } catch (e) {
      log('Login error: $e');
      return false;
    }
  }
}
