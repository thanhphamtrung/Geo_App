import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/bottom_navigation_controllers/bottom_navigation_controller.dart';
import '../../cores/constants/string_const.dart';
import '../../cores/routes/app_pages.dart';

class BottomNavigationScreen extends GetView<BottomNavigationController> {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: Routes.home,
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: BottomNavigationScreenConst.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.business),
              label: BottomNavigationScreenConst.profile,
            )
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.amber[800],
          backgroundColor: Colors.black45,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
