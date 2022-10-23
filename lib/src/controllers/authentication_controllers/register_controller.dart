import 'package:get/get.dart';

import '../../domains/adapters/authentication_repo_adapter.dart';
import '../../domains/entity/user_model.dart';

class RegisterController extends GetxController {
  final IAuthenticationRepository authenticationRepository;

  RegisterController({required this.authenticationRepository});

  Rx<UserModel> user = UserModel().obs;

  Future<bool> signUp() async {
    return await authenticationRepository.userSignUpByEmail(user.value);
  }
}
