import '../../entity/user_entity.dart';

abstract class IAuthenticationRepository {
  Future<bool> userSignUpByEmail(UserEntity user);
  Future<bool> userSignInByEmail(UserEntity user);
  Future<bool> confirmUserSignUp(UserEntity user);
}
