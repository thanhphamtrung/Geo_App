import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

abstract class IAuthenticationProvider {
  /// Sign up method using email as user name.
  Future<SignUpResult?> emailSignUp({
    required String email,
    required String password,
    required String fullName,
  });

  /// Sign in method using email as user name.
  Future<SignInResult?> emailSignIn({
    required String email,
    required String password,
  });

  Future<SignUpResult?> emailSignUpConfirm({
    required String email,
    required String confirmCode,
  });

  Future<SignOutResult?> signOut();
}
