import 'package:get/instance_manager.dart';

import '../../controllers/home_controllers/home_controllers.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
