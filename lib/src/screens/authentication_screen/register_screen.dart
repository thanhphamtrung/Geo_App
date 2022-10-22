import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/authentication_controllers/register_controller.dart';
import '../../cores/constants/app_assets.dart';
import '../../cores/constants/app_colors.dart';
import '../../cores/constants/string_const.dart';
import '../../cores/routes/app_pages.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/rounded_button.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
                key: _formKey,
                child: Column(
                  children: [
                    AppTextField(
                      hintText: LoginConst.email,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      hintText: LoginConst.fullName,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      hintText: LoginConst.password,
                      suffixIcon: const Icon(Icons.visibility_off_rounded),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      hintText: LoginConst.confirmPassword,
                      suffixIcon: const Icon(Icons.visibility_off_rounded),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              Center(
                child: RoundedButton(
                  onPressed: () {},
                  isLarge: true,
                  child: Text(LoginConst.signIn.toUpperCase()),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(LoginConst.dontHaveAccount),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.login);
                    },
                    child: Text(
                      LoginConst.signIn,
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
