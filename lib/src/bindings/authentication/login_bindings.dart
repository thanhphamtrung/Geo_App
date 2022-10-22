import 'package:get/instance_manager.dart';

import '../../controllers/authentication_controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
