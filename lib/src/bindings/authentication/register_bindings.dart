import 'package:geo_app/src/data/authentication/authentication_repository.dart';
import 'package:geo_app/src/data/authentication/provider/i_authentication_provider.dart';
import 'package:geo_app/src/domains/adapters/authentication_repo_adapter.dart';
import 'package:get/instance_manager.dart';

import '../../controllers/authentication_controllers/register_controller.dart';
import '../../data/authentication/provider/authentication_provider.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthenticationProvider>(() => AuthenticationProvider());
    Get.lazyPut<IAuthenticationRepository>(
        () => AuthenticationRepository(provider: Get.find()));
    Get.lazyPut(() => RegisterController(authenticationRepository: Get.find()));
  }
}
