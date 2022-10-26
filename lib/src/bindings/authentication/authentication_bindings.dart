import 'package:get/instance_manager.dart';

import '../../controllers/authentication_controllers/confirm_controller.dart';
import '../../controllers/authentication_controllers/login_controller.dart';
import '../../controllers/authentication_controllers/register_controller.dart';
import '../../domains/adapters/authentication/authentication_repository.dart';
import '../../data/authentication/provider/authentication_provider.dart';
import '../../data/authentication/provider/i_authentication_provider.dart';
import '../../domains/adapters/authentication/authentication_repo_adapter.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthenticationProvider>(() => AuthenticationProvider());
    Get.lazyPut<IAuthenticationRepository>(
        () => AuthenticationRepository(provider: Get.find()));
    Get.lazyPut(() => LoginController(authenticationRepository: Get.find()));
    Get.lazyPut(() => RegisterController(authenticationRepository: Get.find()));
    Get.lazyPut(() => ConfirmController(authenticationRepository: Get.find()));
  }
}
