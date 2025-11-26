import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/common/translations/AppLanguageUpdate.dart';
import 'package:intl/intl.dart';

class Helper {
  DateTime? currentBackPressTime;
  Duration refreshDuration = const Duration(minutes: 3);

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.snackbar(
          AppLanguageUpdate.alert.tr, AppLanguageUpdate.tab_again_to_leave.tr,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(16),
          colorText: Get.theme.primaryColor);
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  String formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  String formatDateWithSlash(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }
}
