import '../entity/user_model.dart';

abstract class IAuthenticationRepository {
  Future<bool> userSignUpByEmail(UserModel user);
  Future<bool> userSignInByEmail(UserModel user);
  Future<bool> confirmUserSignUp(UserModel user);
}
