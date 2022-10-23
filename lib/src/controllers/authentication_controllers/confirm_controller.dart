import 'package:get/get.dart';

import '../../domains/adapters/authentication_repo_adapter.dart';
import '../../domains/entity/user_model.dart';

class ConfirmController extends GetxController {
  final IAuthenticationRepository authenticationRepository;

  ConfirmController({required this.authenticationRepository});

  Rx<UserModel> user = UserModel().obs;

  Future<bool> confirmAccount() async {
    return await authenticationRepository.confirmUserSignUp(user.value);
  }
}
