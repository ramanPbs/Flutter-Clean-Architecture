import 'package:artools/artools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/common/colors.dart';
import 'package:getx_clean_architecture/common/translations/AppLanguageUpdate.dart';

import '../../../global_widgets/block_button_widget.dart';
import '../../../global_widgets/loading_indicator.dart';
import '../../../global_widgets/text_field_widget.dart';
import '../../../routes/app_routes.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  // const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  // const FlutterLogo(
                  //   size: 100,
                  // ).marginOnly(bottom: 20, top: 16),
                  Image.network(
                    "https://possibilitysolutions.com/img/possibility_logo.png",
                  ).marginSymmetric(horizontal: 70, vertical: 50),
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppLanguageUpdate.welcome.tr,
                              style: Get.textTheme.headlineMedium!.copyWith(
                                  letterSpacing: 1.5, color: Colors.black),
                            ).marginOnly(bottom: 8),
                            Text(AppLanguageUpdate.login_to_your_account.tr,
                                    style: Get.textTheme.bodyMedium)
                                .marginOnly(
                              bottom: 40,
                            ),
                          ],
                        ),
                        Form(
                          key: controller.loginFormKey,
                          child: Column(
                            children: [
                              TextFieldWidget(
                                labelText: AppLanguageUpdate.email.tr,
                                hintText: "abc@xyz.com",
                                onSaved: (input) =>
                                    controller.currentUser.value.email = input,
                                validator: (input) => input!.isEmpty
                                    ? AppLanguageUpdate.please_enter_email.tr
                                    : GetUtils.isEmail(input.trim())
                                        ? null
                                        : AppLanguageUpdate
                                            .enter_valid_email.tr,
                                onChanged: (String value) {},
                                keyboardType: TextInputType.emailAddress,
                                iconData: Icon(
                                  Icons.email,
                                  color: AppColors.buttonColor.color,
                                ),
                              ).marginOnly(bottom: 4),
                              Obx(
                                () => TextFieldWidget(
                                  labelText: AppLanguageUpdate.password.tr,
                                  hintText: "*****",
                                  onSaved: (input) => controller
                                      .currentUser.value.password = input!,
                                  onChanged: (input) => controller
                                      .currentUser.value.password = input,
                                  validator: (input) => input!.isEmpty
                                      ? AppLanguageUpdate
                                          .please_enter_password.tr
                                      : input.length < 3
                                          ? AppLanguageUpdate
                                              .minimum_digit_length.tr
                                          : null,
                                  obscureText: controller.hidePassword.value,
                                  keyboardType: TextInputType.visiblePassword,
                                  suffixIcon: GestureDetector(
                                    onTap: () => controller.hidePassword.value =
                                        !controller.hidePassword.value,
                                    child: Icon(
                                      controller.hidePassword.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  iconData: Icon(
                                    Icons.lock,
                                    color: AppColors.buttonColor.color,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.FORGOT_PASSWORD);
                                    },
                                    child: Text(
                                        AppLanguageUpdate.forgot_password.tr,
                                        style: Get.textTheme.bodyMedium),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 24),
                              BlockButtonWidget(
                                onPressed: controller.login,
                                color: AppColors.buttonColor.color,
                                text: Text(AppLanguageUpdate.logIn.tr,
                                    style: Get.textTheme.headlineMedium!
                                        .copyWith(
                                            color: Colors.white, fontSize: 16)),
                                width: MediaQuery.sizeOf(context).width,
                                verticalPadding: 14,
                              ).marginOnly(top: 48, left: 20, right: 20),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLanguageUpdate.change_language.tr,
                                      style: TextStyle(
                                          color: AppColors.darkText.color,
                                          fontSize: 16),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            // Your bottom sheet content goes here
                                            return Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height /
                                                        3,
                                                // Example fixed height
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 24.0,
                                                      horizontal: 16),
                                                  child: Center(
                                                      child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 12.0),
                                                        child: Text('Language'),
                                                      ),
                                                      Divider(height: 1),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 12.0),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .ChangeLanguage(
                                                                    "English");
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'English',
                                                            style: TextStyle(
                                                                color: controller
                                                                            .getXLocalStorage
                                                                            .userLanguage ==
                                                                        "English"
                                                                    ? AppColors
                                                                        .buttonColor
                                                                        .color
                                                                    : AppColors
                                                                        .darkText
                                                                        .color),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(height: 1),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 12.0),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .ChangeLanguage(
                                                                    "Hindi");
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Hindi',
                                                            style: TextStyle(
                                                                color: controller
                                                                            .getXLocalStorage
                                                                            .userLanguage ==
                                                                        "Hindi"
                                                                    ? AppColors
                                                                        .buttonColor
                                                                        .color
                                                                    : AppColors
                                                                        .darkText
                                                                        .color),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(height: 1),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 12.0),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .ChangeLanguage(
                                                                    "Spanish");
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Spanish',
                                                            style: TextStyle(
                                                                color: controller
                                                                            .getXLocalStorage
                                                                            .userLanguage ==
                                                                        "Spanish"
                                                                    ? AppColors
                                                                        .buttonColor
                                                                        .color
                                                                    : AppColors
                                                                        .darkText
                                                                        .color),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                                ));
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ).isAbsorbing(controller.loading.value),
            ),
            controller.loading.value
                ? LoadingIndicator(
                    isVisible: controller.loading.value,
                    loadingText: 'Logging In'.tr)
                : const SizedBox()
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLanguageUpdate.don_not_have_account.tr,
                  style: Get.textTheme.bodyMedium),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => Get.offAllNamed(Routes.REGISTER),
                child: Text(
                  AppLanguageUpdate.sign_up.tr,
                  style: Get.textTheme.headlineMedium!.copyWith(
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ).isAbsorbing(controller.loading.value),
    );
  }

  Size get preferredSize => const Size.fromHeight(100); //
}
