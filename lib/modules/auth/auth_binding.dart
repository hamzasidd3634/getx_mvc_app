import 'package:get/get.dart';
import 'controller/auth_controller.dart';

/// Binding for the Auth module.
/// Registers [AuthController] when the route is accessed.
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
