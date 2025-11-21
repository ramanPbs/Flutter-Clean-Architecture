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
                  ).marginSymmetric(horizontal: 30, vertical: 20),
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
                                  color: AppColors.primaryColor.color,
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
                                    color: AppColors.primaryColor.color,
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
                                color: Get.theme.primaryColor,
                                text: Text(AppLanguageUpdate.logIn.tr,
                                    style: Get.textTheme.headlineMedium!
                                        .copyWith(
                                            color: Colors.white, fontSize: 16)),
                                width: 150,
                                verticalPadding: 14,
                              ).marginOnly(top: 48),
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
                                    Switch(
                                      value: controller.isSwitched.value,
                                      onChanged: (value) {
                                        controller.toggleSwitch(value);
                                      },
                                    ),
                                  ],
                                ),
                              )
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
                  style: Get.textTheme.headlineMedium!.copyWith(fontSize: 16),
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
