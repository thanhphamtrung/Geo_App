import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

abstract class IAuthenticationProvider {
  Future<SignUpResult?> emailSignUp({
    required String email,
    required String password,
    required String fullName,
  });
}
