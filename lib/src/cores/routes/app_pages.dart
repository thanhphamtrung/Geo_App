import 'package:get/get.dart';

import '../../bindings/authentication/authentication_bindings.dart';
import '../../screens/authentication_screen/confirm_screen.dart';
import '../../screens/authentication_screen/login_screen.dart';
import '../../screens/authentication_screen/register_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.confirm;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterScreen(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.confirm,
      page: () => const ConfirmScreen(),
      binding: AuthenticationBinding(),
    ),
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
