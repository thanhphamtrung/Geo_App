import 'package:get/get.dart';

import '../../screens/authentication_screen/login_screen.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      // binding: Login(),
    ),
    // GetPage(
    //   name: Routes.register,
    //   page: () => const RegisterScreen(),
    //   // binding: Login(),
    // ),
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
