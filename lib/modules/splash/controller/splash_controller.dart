import 'package:get/get.dart';
import '../../../core/services/storage_service.dart';
import '../../../routes/app_routes.dart';

/// Controller for the Splash screen.
/// Checks login session and navigates accordingly after a delay.
class SplashController extends GetxController {
  final StorageService _storage = Get.find<StorageService>();

  @override
  void onInit() {
    super.onInit();
    _navigateAfterDelay();
  }

  /// Waits 3 seconds, then routes to Home or Login based on session.
  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));

    if (_storage.isLoggedIn) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
