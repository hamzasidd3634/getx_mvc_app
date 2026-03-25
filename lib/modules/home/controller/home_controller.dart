import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../core/services/api_service.dart';
import '../../../core/utils/api_constants.dart';
import '../../../core/utils/app_utils.dart';
import '../../../data/models/post_model.dart';

/// Controller for the Home module.
/// Fetches and manages the list of posts from the API.
class HomeController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();

  // ─── Observable State ───
  final posts = <PostModel>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  /// Fetches posts from the JSONPlaceholder API.
  Future<void> fetchPosts() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _apiService.dio.get(ApiConstants.postsEndpoint);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        posts.value = data
            .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        errorMessage.value = 'Failed to load posts (${response.statusCode})';
      }
    } on DioException catch (e) {
      errorMessage.value = e.message ?? 'Network error occurred';
      AppUtils.showError('Error', errorMessage.value);
    } catch (e) {
      errorMessage.value = 'An unexpected error occurred';
      AppUtils.showError('Error', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  /// Refreshes the post list (pull-to-refresh).
  Future<void> refreshPosts() async {
    await fetchPosts();
  }
}
