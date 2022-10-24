import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/authentication_controllers/register_controller.dart';
import '../../cores/constants/app_assets.dart';
import '../../cores/constants/app_colors.dart';
import '../../cores/constants/string_const.dart';
import '../../cores/routes/app_pages.dart';
import '../../cores/validations/register_validation.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/rounded_button.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Center(
                  child: SizedBox(
                      height: 187,
                      width: 180,
                      child: Image.asset(ImageAssetsPath.logo)),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    AppTextField(
                      hintText: AuthenticationConst.email,
                      onChanged: (value) {
                        controller.user.update((user) {
                          user?.email = value;
                        });
                      },
                      validator: RegisterValidation().getEmailValidator(),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      hintText: AuthenticationConst.fullName,
                      onChanged: (value) {
                        controller.user.update((user) {
                          user?.fullName = value;
                        });
                      },
                      validator: RegisterValidation().getFullNameValidator(),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      hintText: AuthenticationConst.password,
                      suffixIcon: const Icon(Icons.visibility_off_rounded),
                      onChanged: (value) {
                        controller.user.update((user) {
                          user?.password = value;
                        });
                      },
                      validator: RegisterValidation().getPasswordValidator(),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              Center(
                child: RoundedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (await controller.signUp()) {
                        Get.toNamed(Routes.confirm);
                      }
                    }
                  },
                  isLarge: true,
                  child: Text(AuthenticationConst.signUp.toUpperCase()),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AuthenticationConst.dontHaveAccount),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.login);
                    },
                    child: Text(
                      AuthenticationConst.signIn,
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 46),
            ],
          ),
        ),
      ),
    );
  }
}
