import 'package:get/get.dart';

import '../../bindings/authentication/authentication_bindings.dart';
import '../../bindings/bottom_navigation/bottom_navigation_bindings.dart';
import '../../bindings/home/home_bindings.dart';
import '../../screens/authentication/confirm_screen.dart';
import '../../screens/authentication/login_screen.dart';
import '../../screens/authentication/register_screen.dart';
import '../../screens/bottom_navigation/bottom_navigation_screen.dart';
import '../../screens/home/home_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.bottomNavBar;

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
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.bottomNavBar,
      page: () => const BottomNavigationScreen(),
      binding: BottomNavigationBinding(),
    ),
  ];
}
