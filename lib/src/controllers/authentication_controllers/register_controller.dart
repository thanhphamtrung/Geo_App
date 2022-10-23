import 'package:geo_app/src/domains/adapters/authentication_repo_adapter.dart';
import 'package:geo_app/src/domains/entity/user_model.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final IAuthenticationRepository authenticationRepository;

  RegisterController({required this.authenticationRepository});

  Rx<UserModel> user = UserModel().obs;

  Future<bool> signUp() async {
    return await authenticationRepository.userSignUpByEmail(user.value);
  }
}
