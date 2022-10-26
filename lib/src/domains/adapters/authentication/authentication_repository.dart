import 'package:amplify_flutter/amplify_flutter.dart';

import 'authentication_repo_adapter.dart';
import '../../entity/user_entity.dart';
import '../../../data/models/confirm_sign_up_model.dart';
import '../../../data/models/login_model.dart';
import '../../../data/models/sign_up_model.dart';
import '../../../data/authentication/provider/i_authentication_provider.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationProvider provider;

  AuthenticationRepository({required this.provider});

  @override
  Future<bool> userSignUpByEmail(UserEntity user) async {
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
  Future<bool> userSignInByEmail(UserEntity user) async {
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
  Future<bool> confirmUserSignUp(UserEntity user) async {
    try {
      var signUpModel = ConfirmSignUpModel.convertUserModelToSignInModel(user);

      if (signUpModel != null) {
        var signUpResult = await provider.emailSignUpConfirm(
          email: signUpModel.email,
          confirmCode: signUpModel.confirmCode,
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
