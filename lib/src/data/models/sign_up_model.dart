import '../../domains/entity/user_model.dart';

class SignUpModel {
  String email;
  String password;
  String fullName;

  SignUpModel({
    required this.email,
    required this.password,
    required this.fullName,
  });

  static SignUpModel? convertUserModelToSignUpModel(UserModel user) {
    if (user.email != null && user.password != null && user.fullName != null) {
      var signUpModel = SignUpModel(
          email: user.email!,
          password: user.password!,
          fullName: user.fullName!);
      return signUpModel;
    } else {
      return null;
    }
  }
}
