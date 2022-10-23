import 'package:get/get.dart';

import '../../domains/adapters/authentication_repo_adapter.dart';
import '../../domains/entity/user_model.dart';

class LoginController extends GetxController {
  final IAuthenticationRepository authenticationRepository;

  LoginController({required this.authenticationRepository});

  Rx<UserModel> user = UserModel().obs;

  Future<bool> signIn() async {
    return await authenticationRepository.userSignInByEmail(user.value);
  }
}
