import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_clean_architecture/app/local_storage/GetXLoaclStorage.dart';
import 'package:getx_clean_architecture/app/modules/auth/controllers/login_controller.dart';
import 'package:getx_clean_architecture/app/routes/app_pages.dart';
import 'package:getx_clean_architecture/app/services/background/user_service.dart';
import 'package:getx_clean_architecture/common/LightAndDarkTheme.dart';
import 'package:getx_clean_architecture/common/translations/AppLanguageUpdate.dart';
import 'package:getx_clean_architecture/common/translations/app_translation.dart';
import 'app/services/background/local_storage_service.dart';
import 'common/theme.dart';

void main() async {
  await GetStorage.init();

  GetXLocalStorage localStorage = Get.put(GetXLocalStorage());

  await localStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => LocalStorageService().init());
  await Get.putAsync(() => UserService().init());

  LoginController loginController = Get.put(LoginController());

  runApp(
    GetMaterialApp(
      title: 'CleanArchitectureGetX',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      translations: AppTranslation(),
      theme: getAppTheme(),
      // theme: LightAndDarkTheme.themeDatalight,
      // darkTheme: LightAndDarkTheme.themeDataDark,
      // themeMode: loginController.themeMode,
      locale: localStorage.userLanguage.isNotEmpty
          ? supportedLocales[localStorage.userLanguage] ??
              const Locale('en', 'US')
          : localStorage.userLanguage == "Hindi"
              ? const Locale('hi', 'IN')
              : const Locale('es', 'SP'),
    ),
  );
  // print(" test " + LightAndDarkTheme.themeDatalight.toString());
}

final Map<String, Locale> supportedLocales = {
  'Language': const Locale('en', 'US'),
  'English': const Locale('en', 'US'),
  'Hindi': const Locale('hi', 'IN'),
  'Spanish': const Locale('es', 'SP'),
};
