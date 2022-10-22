import 'package:amplify_flutter/amplify_flutter.dart';

import '../../domains/adpaters/authentication_repo_adapter.dart';
import '../../domains/entity/user_model.dart';

import 'provider/i_authentication_provider.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationProvider provider;

  AuthenticationRepository({required this.provider});

  @override
  Future<bool> userSignUpByEmail(UserModel user) async {
    try {
      var signUpResult = await provider.emailSignUp(
        email: user.email,
        password: user.password,
        fullName: user.fullName,
      );
      if (signUpResult != null) {
        return true;
      }
      return false;
    } catch (e) {
      safePrint(e);
      return false;
    }
  }
}
