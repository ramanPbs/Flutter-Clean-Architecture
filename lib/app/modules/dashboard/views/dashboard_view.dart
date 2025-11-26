import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:getx_clean_architecture/common/colors.dart';
import 'package:getx_clean_architecture/common/translations/AppLanguageUpdate.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.color,
      body: Obx(
        () => controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                primary: true,
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return const Placeholder();
                },
              ),
      ),
    );
  }
}
