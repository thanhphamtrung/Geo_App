import 'package:get/get.dart';

import '../../domains/adapters/authentication/authentication_repo_adapter.dart';
import '../../domains/entity/user_entity.dart';

class LoginController extends GetxController {
  final IAuthenticationRepository authenticationRepository;

  LoginController({required this.authenticationRepository});

  Rx<UserEntity> user = UserEntity().obs;

  Future<bool> signIn() async {
    return await authenticationRepository.userSignInByEmail(user.value);
  }
}
