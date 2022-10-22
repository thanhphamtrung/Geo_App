import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/authentication_controllers/login_controller.dart';
import '../../cores/constants/app_assets.dart';
import '../../cores/constants/app_colors.dart';
import '../../cores/constants/string_consts.dart';
import '../../cores/routes/app_pages.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/rounded_button.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              AppTextField(
                hintText: LoginConst.email,
              ),
              const SizedBox(height: 16),
              AppTextField(
                hintText: LoginConst.password,
                suffixIcon: const Icon(Icons.visibility_off_rounded),
              ),
              const SizedBox(height: 16),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.forgotPassword);
                  },
                  child: Text(
                    LoginConst.forgotPassword,
                    style: TextStyle(
                        color: const Color(0xFF272727).withOpacity(0.5)),
                  )),
              const SizedBox(height: 16),
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
                  Text(LoginConst.dontHaveAcount),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.register);
                    },
                    child: Text(
                      LoginConst.signUp,
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
