import '../../domains/entity/user_entity.dart';

class ConfirmSignUpModel {
  String email;
  String confirmCode;

  ConfirmSignUpModel({
    required this.email,
    required this.confirmCode,
  });

  static ConfirmSignUpModel? convertUserModelToSignInModel(UserEntity user) {
    if (user.email != null && user.confirmCode != null) {
      var signUpModel = ConfirmSignUpModel(
        email: user.email!,
        confirmCode: user.confirmCode!,
      );
      return signUpModel;
    } else {
      return null;
    }
  }
}
