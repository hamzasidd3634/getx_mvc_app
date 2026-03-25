import 'package:get/get.dart';
import '../modules/auth/auth_binding.dart';
import '../modules/auth/view/login_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/view/home_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/view/splash_view.dart';
import 'app_routes.dart';

/// Defines all GetX pages (routes) with their bindings.
class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
