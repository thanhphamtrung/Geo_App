import 'package:get/instance_manager.dart';

import '../../controllers/authentication_controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
