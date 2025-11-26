import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/local_storage/GetXLoaclStorage.dart';
import 'package:getx_clean_architecture/common/LightAndDarkTheme.dart';

import '../../../../common/ui.dart';
import '../../../models/user_model.dart';
import '../../../routes/app_routes.dart';
import '../../../services/background/user_service.dart';
import '../services/auth_service.dart';

class LoginController extends GetxController {
  // LoginController({required this.authService});

  final GetXLocalStorage getXLocalStorage = Get.find<GetXLocalStorage>();

  // final AuthService authService;
  var selectedLanguage = "Language".obs;

  final loading = false.obs;
  final Rx<User> currentUser = Get.find<UserService>().user;
  final hidePassword = true.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  var isSwitched = false.obs;

  void ChangeLanguage(String value) {
    selectedLanguage.value = value;
    if (value == "Hindi") {
      var locale = const Locale('hi', 'IN');
      getXLocalStorage.setUserLanguage(value);
      Get.updateLocale(locale);
    } else if (value == "English") {
      var locale = const Locale('en', 'US');
      getXLocalStorage.setUserLanguage(value);

      Get.updateLocale(locale);
    } else if (value == "Spanish") {
      var locale = const Locale('es', 'SP');
      getXLocalStorage.setUserLanguage(value);

      Get.updateLocale(locale);
    }
    update();
  }

  ThemeMode get themeMode =>
      isSwitched.value ? ThemeMode.dark : ThemeMode.light;

  void toggleSwitch(bool value) {
    isSwitched.value = !isSwitched.value;
    print(" === " + isSwitched.value.toString());
    update();
  }

  void login() async {
    Get.focusScope?.unfocus();
    if (!loginFormKey.currentState!.validate()) return;
    loginFormKey.currentState!.save();
    loading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 5));
      // await authService.performAuth(currentUser.value);
      // Get.offAllNamed(Routes.ROOT);
    } on DioException catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.message!));
    } finally {
      loading.value = false;
    }
  }
}
