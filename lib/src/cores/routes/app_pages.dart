import 'package:get/get.dart';

import '../../bindings/authentication/login_bindings.dart';
import '../../bindings/authentication/register_bindings.dart';
import '../../screens/authentication_screen/login_screen.dart';
import '../../screens/authentication_screen/register_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    // GetPage(
    //   name: Routes.forgotPassword,
    //   page: () => const ForgotPasswordScreen(),
    //   // binding: Login(),
    // ),
    // GetPage(
    //   name: Routes.home,
    //   page: () => const HomeScreen(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: Routes.detail,
    //   page: () => const DetailScreen(),
    //   // binding: HomeBinding(),
    // ),
  ];
}
