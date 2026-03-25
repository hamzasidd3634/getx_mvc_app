import 'package:get/get.dart';
import 'controller/splash_controller.dart';

/// Binding for the Splash module.
/// Registers [SplashController] when the route is accessed.
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
