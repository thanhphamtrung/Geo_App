import '../entity/user_model.dart';

abstract class IAuthenticationRepository {
  void userSignUpByEmail(UserModel user);
}
