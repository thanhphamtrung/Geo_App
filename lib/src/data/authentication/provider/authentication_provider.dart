import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'i_authentication_provider.dart';

class AuthenticationProvider implements IAuthenticationProvider {
  @override
  Future<SignUpResult?> emailSignUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.name: fullName,
      };
      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      return result;
    } on AuthException catch (e) {
      safePrint(e.message);

      // Return [null] if sign up fail.
      return null;
    }
  }

  @override
  Future<SignInResult?> emailSignIn(
      {required String email, required String password}) async {
    try {
      await Amplify.Auth.signOut();
      final result = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      return result;
    } on AuthException catch (e) {
      safePrint(e.message);
      // Return [null] if sign in fail.
      return null;
    }
  }

  @override
  Future<SignUpResult?> emailSignUpConfirm(
      {required String email, required String confirmCode}) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
          username: email, confirmationCode: confirmCode);
      return result;
    } on AuthException catch (e) {
      safePrint(e.message);
      // Return [null] if confirm fail.
      return null;
    }
  }
}
