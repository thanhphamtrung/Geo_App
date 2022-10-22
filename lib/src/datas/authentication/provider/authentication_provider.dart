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
        CognitoUserAttributeKey.email: 'email@domain.com',
        CognitoUserAttributeKey.phoneNumber: '+15559101234',
        // additional attributes as needed
      };
      final result = await Amplify.Auth.signUp(
        username: 'myusername',
        password: 'mysupersecurepassword',
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      return result;
    } on AuthException catch (e) {
      safePrint(e.message);

      // Return [null] if sign up fail.
      return null;
    }
  }
}
