import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/common/translations/AppLanguageUpdate.dart';

import '../../../../common/helper.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../controllers/root_controller.dart';
import '../widgets/custom_bottom_navigation_item.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helper().onWillPop,
      child: Scaffold(
        body: Obx(() => AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: KeyedSubtree(
                key: ValueKey(controller.currentIndex.value),
                child: controller.currentPage,
              ),
            )),
        bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          itemColor: context.theme.colorScheme.primary,
          // currentIndex: controller.currentIndex.value,
          // onChange: controller.changePage,
          children: [
            CustomBottomNavigationItem(
              iconUrl: Icons.dashboard,
              selectedIconUrl: Icons.home,
              label: AppLanguageUpdate.dashboard.tr,
              color: Get.theme.primaryColor,
            ),
            CustomBottomNavigationItem(
              iconUrl: Icons.mark_email_read,
              selectedIconUrl: Icons.shop,
              label: AppLanguageUpdate.reservations.tr,
              color: Get.theme.primaryColor,
            ),
            CustomBottomNavigationItem(
              iconUrl: Icons.message_outlined,
              selectedIconUrl: Icons.message,
              label: AppLanguageUpdate.favourite.tr,
              color: Get.theme.primaryColor,
            ),
            CustomBottomNavigationItem(
              iconUrl: Icons.person_outline,
              selectedIconUrl: Icons.person,
              label: AppLanguageUpdate.profile.tr,
              color: Get.theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
