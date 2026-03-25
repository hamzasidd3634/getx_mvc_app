import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Utility class for showing GetX snackbars and loaders.
class AppUtils {
  AppUtils._();

  /// Shows an error snackbar.
  static void showError(String title, String message) {
    if (Get.isSnackbarOpen) return;
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.shade600,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.error_outline, color: Colors.white),
    );
  }

  /// Shows a success snackbar.
  static void showSuccess(String title, String message) {
    if (Get.isSnackbarOpen) return;
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade600,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.check_circle_outline, color: Colors.white),
    );
  }

  /// Shows a full-screen loading overlay.
  static void showLoader() {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black45,
    );
  }

  /// Hides the loading overlay.
  static void hideLoader() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
