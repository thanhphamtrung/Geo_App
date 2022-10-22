import 'package:geo_app/src/domains/adapters/authentication_repo_adapter.dart';
import 'package:geo_app/src/domains/entity/user_model.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final IAuthenticationRepository authenticationRepository;

  RegisterController({required this.authenticationRepository});

  RxBool isSignUpComplete = false.obs;
  Rx<UserModel> user = UserModel().obs;

  Future signUp() async {
    bool result = await authenticationRepository.userSignUpByEmail(user.value);
    if (result) {
      isSignUpComplete = true.obs;
    }
  }
}
