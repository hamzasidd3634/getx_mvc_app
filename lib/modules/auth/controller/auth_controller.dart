import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/utils/api_constants.dart';
import '../../../core/utils/app_utils.dart';
import '../../../data/models/user_model.dart';
import '../../../routes/app_routes.dart';

/// Controller for the Auth (Login) module.
/// Handles form validation, API login, and session storage.
class AuthController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final StorageService _storage = Get.find<StorageService>();

  // ─── Observable State ───
  final isLoading = false.obs;
  final obscurePassword = true.obs;

  /// Toggles password visibility.
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  /// Performs login with the given [email] and [password].
  /// Calls the mock API, saves session, and navigates to Home.
  Future<void> login({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    try {
      // Call mock login API (POST to /posts on JSONPlaceholder)
      final response = await _apiService.dio.post(
        ApiConstants.loginEndpoint,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;

        // Create user model from response
        final user = UserModel(
          id: data['id'] as int? ?? 1,
          email: email,
          token: 'mock_jwt_token_${data['id']}',
        );

        // Save session locally
        await _storage.saveLoginSession(
          email: user.email,
          token: user.token,
        );

        AppUtils.showSuccess('Welcome!', 'Logged in as $email');

        // Navigate to home and clear backstack
        Get.offAllNamed(AppRoutes.home);
      } else {
        AppUtils.showError('Login Failed', 'Invalid credentials');
      }
    } on DioException catch (e) {
      AppUtils.showError(
        'Network Error',
        e.message ?? 'Could not connect to the server',
      );
    } catch (e) {
      AppUtils.showError('Error', 'An unexpected error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  /// Logs the user out and navigates to Login.
  Future<void> logout() async {
    await _storage.clearSession();
    Get.offAllNamed(AppRoutes.login);
  }
}
