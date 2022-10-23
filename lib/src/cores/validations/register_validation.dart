import 'package:form_validator/form_validator.dart';

import '../constants/app_regex.dart';
import '../constants/string_const.dart';

class RegisterValidation {
  String? Function(String?) getEmailValidator() =>
      ValidationBuilder().email().build();
  String? Function(String?) getFullNameValidator() =>
      ValidationBuilder().minLength(6).build();
  String? Function(String?) getPasswordValidator() =>
      ValidationBuilder().minLength(6).password().build();
}

extension CustomValidationBuilder on ValidationBuilder {
  password() => add((value) {
        if (!AppRegex.password.hasMatch(value ?? '')) {
          return AuthenticationConst.passwordValidationMessage;
        }
        return null;
      });
}
