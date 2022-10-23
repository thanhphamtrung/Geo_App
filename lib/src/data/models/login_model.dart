import '../../domains/entity/user_model.dart';

class LoginModel {
  String email;
  String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  static LoginModel? convertUserModelToSignInModel(UserModel user) {
    if (user.email != null && user.password != null) {
      var signUpModel = LoginModel(
        email: user.email!,
        password: user.password!,
      );
      return signUpModel;
    } else {
      return null;
    }
  }
}
