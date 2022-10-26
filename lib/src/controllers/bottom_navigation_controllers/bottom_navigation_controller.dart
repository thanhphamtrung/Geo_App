import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bindings/home/home_bindings.dart';
import '../../bindings/profile/profile_bindings.dart';
import '../../cores/routes/app_pages.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/profile/profile_screen.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 1.obs;

  final pages = <String>[Routes.home, Routes.profile];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.home) {
      return GetPageRoute(
        settings: settings,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
      );
    }

    if (settings.name == Routes.profile) {
      return GetPageRoute(
        settings: settings,
        page: () => const ProfileScreen(),
        binding: ProfileBinding(),
      );
    }
    return null;
  }
}
