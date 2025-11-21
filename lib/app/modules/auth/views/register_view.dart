import 'dart:io';

import 'package:artools/artools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/global_widgets/block_button_widget.dart';
import 'package:getx_clean_architecture/app/global_widgets/loading_indicator.dart';
import 'package:getx_clean_architecture/app/modules/auth/controllers/register_controller.dart';
import 'package:getx_clean_architecture/app/routes/app_routes.dart';
import 'package:getx_clean_architecture/app/services/image_picker.dart';
import 'package:getx_clean_architecture/common/translations/AppLanguageUpdate.dart';

import '../../../../common/colors.dart';
import '../../../global_widgets/text_field_widget.dart';

class RegisterView extends GetView<RegisterController> with MyImagePicker {
  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var currentUser = controller.currentUser.value;
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Obx(
          () => Stack(
            children: [
              SafeArea(
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                color:
                                    Get.theme.primaryColor.withOpacity(0.075),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(24),
                                ),
                              ),
                              child: controller.pickedImage.value != null
                                  ? Image.file(
                                      File(controller.pickedImagePath.value),
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(
                                      Icons.person_2_sharp,
                                      color: Get.theme.primaryColor,
                                      size: 80,
                                    ),
                            ),
                          ),
                          const SizedBox(
                            width: 130,
                            height: 130,
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: GestureDetector(
                                onTap: () => showImagePicker(
                                      controller.pickedImage,
                                      controller.pickedImagePath,
                                    ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                )
                                // Container(
                                //   height: 35,
                                //   width: 35,
                                //   decoration: BoxDecoration(
                                //     color: Get.theme.primaryColor,
                                //     border: Border.all(
                                //       width: 1,
                                //       color: Colors.white,
                                //     ),
                                //     borderRadius: const BorderRadius.all(
                                //       Radius.circular(10),
                                //     ),
                                //   ),
                                //   child: const Center(
                                //     child: Icon(
                                //       Icons.camera_alt,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // ),
                                ),
                          )
                        ],
                      ),
                    ),
                    Form(
                      key: controller.registerFormKey,
                      child: Column(
                        children: [
                          15.height,
                          TextFieldWidget(
                              labelText: AppLanguageUpdate.username.tr,
                              hintText: "username",
                              onSaved: (input) => currentUser.userName = input!,
                              validator: (input) => input!.isEmpty
                                  ? AppLanguageUpdate.please_enter_username.tr
                                  : input.length < 3
                                      ? "You must enter 3 characters least"
                                      : null,
                              iconData: Icon(
                                Icons.person_2,
                                color: Get.theme.primaryColor,
                              )),
                          TextFieldWidget(
                            labelText: AppLanguageUpdate.email.tr,
                            hintText: "abc@xyz.com",
                            onSaved: (input) => currentUser.email = input,
                            validator: (input) => input!.isEmpty
                                ? AppLanguageUpdate.please_enter_email.tr
                                : GetUtils.isEmail(input.trim())
                                    ? null
                                    : AppLanguageUpdate.enter_valid_email.tr,
                            onChanged: (String value) {},
                            keyboardType: TextInputType.emailAddress,
                            iconData: Icon(
                              Icons.email,
                              color: Get.theme.primaryColor,
                            ),
                          ),
                          TextFieldWidget(
                              labelText: AppLanguageUpdate.password.tr,
                              hintText: "Password",
                              onSaved: (input) => currentUser.password = input!,
                              onChanged: (input) =>
                                  currentUser.password = input,
                              validator: (input) => input!.isEmpty
                                  ? AppLanguageUpdate.please_enter_password.tr
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
                                  controller.hideConfirmPassword.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              iconData: Icon(
                                Icons.lock,
                                color: Get.theme.primaryColor,
                              )),
                          TextFieldWidget(
                            labelText: AppLanguageUpdate.confirm_password.tr,
                            hintText: "Confirm password",
                            validator: (input) => input != currentUser.password
                                ? AppLanguageUpdate.password_did_not_match.tr
                                : null,
                            obscureText: controller.hideConfirmPassword.value,
                            keyboardType: TextInputType.visiblePassword,
                            suffixIcon: GestureDetector(
                              onTap: () =>
                                  controller.hideConfirmPassword.value =
                                      !controller.hideConfirmPassword.value,
                              child: Icon(
                                controller.hideConfirmPassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            iconData: Icon(
                              Icons.lock,
                              color: Get.theme.primaryColor,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  side: BorderSide(
                                      width: 2, color: Get.theme.primaryColor),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                  activeColor: Get.theme.primaryColor,
                                  value: controller
                                      .isTermsAndConditionsAccepted.value,
                                  onChanged: (val) {
                                    controller.isTermsAndConditionsAccepted
                                            .value =
                                        !controller
                                            .isTermsAndConditionsAccepted.value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        "${AppLanguageUpdate.accept.tr} ",
                                        style:
                                            Get.textTheme.bodyMedium!.copyWith(
                                          color: AppColors.medTextColor.color,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.toNamed(
                                            Routes.TERMS_OF_SERVICES),
                                        child: Text(
                                          AppLanguageUpdate.term_condition.tr,
                                          style: Get.textTheme.bodyMedium!
                                              .copyWith(
                                            color: Get.theme.primaryColor,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        " ${AppLanguageUpdate.and.tr} ",
                                        style:
                                            Get.textTheme.bodyMedium!.copyWith(
                                          color: AppColors.medTextColor.color,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            Get.toNamed(Routes.PRIVACY_POLICY),
                                        child: Text(
                                          AppLanguageUpdate.privacy_policy.tr,
                                          style: Get.textTheme.bodyMedium!
                                              .copyWith(
                                            color: Get.theme.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          BlockButtonWidget(
                            onPressed: controller.register,
                            color: Get.theme.primaryColor,
                            text: Text(AppLanguageUpdate.sign_up.tr,
                                style: Get.textTheme.headlineMedium!.copyWith(
                                    color: Colors.white, fontSize: 16)),
                            width: 150,
                            verticalPadding: 14,
                          ).marginOnly(top: 36),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppLanguageUpdate.already_have_an_account.tr,
                                  style: Get.textTheme.bodyMedium),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () => Get.offAllNamed(Routes.LOGIN),
                                child: Text(
                                  AppLanguageUpdate.sign_in.tr,
                                  style: Get.textTheme.headlineMedium!
                                      .copyWith(fontSize: 16),
                                ),
                              )
                            ],
                          ).paddingOnly(bottom: 36, top: 48),
                        ],
                      ),
                    ),
                  ],
                ).isAbsorbing(controller.loading.value),
              ),
              controller.loading.value
                  ? LoadingIndicator(
                      isVisible: controller.loading.value,
                      loadingText: 'Creating account'.tr)
                  : const SizedBox()
            ],
          ),
        ));
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize =>
      const Size.fromHeight(120); // Set preferred height here

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SafeArea(
          child: Column(
        children: [
          Text(
            AppLanguageUpdate.lets_start_your_journay.tr,
            style: Get.textTheme.headlineMedium,
          ).marginOnly(bottom: 8, top: 16),
          Text(AppLanguageUpdate.create_your_account.tr,
              style: Get.textTheme.bodyMedium),
          // const SizedBox(height: 16,)
        ],
      )),
    );
  }
}
