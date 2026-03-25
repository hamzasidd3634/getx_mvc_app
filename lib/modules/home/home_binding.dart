import 'package:get/get.dart';
import '../auth/controller/auth_controller.dart';
import 'controller/home_controller.dart';

/// Binding for the Home module.
/// Registers [HomeController] and ensures [AuthController]
/// is available for logout functionality.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    // Ensure AuthController is available for logout
    if (!Get.isRegistered<AuthController>()) {
      Get.lazyPut<AuthController>(() => AuthController());
    }
  }
}
