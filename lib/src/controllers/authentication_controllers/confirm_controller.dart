import 'package:get/get.dart';

import '../../domains/adapters/authentication/authentication_repo_adapter.dart';
import '../../domains/entity/user_entity.dart';

class ConfirmController extends GetxController {
  final IAuthenticationRepository authenticationRepository;

  ConfirmController({required this.authenticationRepository});

  Rx<UserEntity> user = UserEntity().obs;

  Future<bool> confirmAccount() async {
    return await authenticationRepository.confirmUserSignUp(user.value);
  }
}
