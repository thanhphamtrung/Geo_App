import 'package:get/instance_manager.dart';

import '../../controllers/bottom_navigation_controllers/bottom_navigation_controller.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController());
  }
}
