import 'package:amplify_flutter/amplify_flutter.dart';

import '../../domains/adpaters/authentication_repo_adapter.dart';
import '../../domains/entity/user_model.dart';
import '../models/confirm_sign_up_model.dart';
import '../models/login_model.dart';
import '../models/sign_up_model.dart';
import 'provider/i_authentication_provider.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationProvider provider;

  AuthenticationRepository({required this.provider});

  @override
  Future<bool> userSignUpByEmail(UserModel user) async {
    try {
      var signUpModel = SignUpModel.convertUserModelToSignUpModel(user);

      if (signUpModel != null) {
        var signUpResult = await provider.emailSignUp(
          email: signUpModel.email,
          password: signUpModel.password,
          fullName: signUpModel.fullName,
        );
        if (signUpResult != null) {
          return true;
        }
      }

      return false;
    } catch (e) {
      safePrint(e);
      return false;
    }
  }

  @override
  Future<bool> userSignInByEmail(UserModel user) async {
    try {
      var signUpModel = LoginModel.convertUserModelToSignInModel(user);

      if (signUpModel != null) {
        var signUpResult = await provider.emailSignIn(
          email: signUpModel.email,
          password: signUpModel.password,
        );
        if (signUpResult != null) {
          return true;
        }
      }

      return false;
    } catch (e) {
      safePrint(e);
      return false;
    }
  }

  @override
  Future<bool> confirmUserSignUp(UserModel user) async {
    try {
      var signUpModel = ConfirmSignUpModel.convertUserModelToSignInModel(user);

      if (signUpModel != null) {
        var signUpResult = await provider.emailSignIn(
          email: signUpModel.email,
          password: signUpModel.confirmCode,
        );
        if (signUpResult != null) {
          return true;
        }
      }

      return false;
    } catch (e) {
      safePrint(e);
      return false;
    }
  }
}
