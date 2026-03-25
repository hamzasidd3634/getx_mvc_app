import 'package:get_storage/get_storage.dart';

/// Service for local storage operations using GetStorage.
/// Handles persisting and retrieving login session state.
class StorageService {
  final _box = GetStorage();

  // ─── Keys ───
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _userEmailKey = 'user_email';
  static const String _userTokenKey = 'user_token';

  // ─── Login Session ───

  /// Saves login session data.
  Future<void> saveLoginSession({
    required String email,
    required String token,
  }) async {
    await _box.write(_isLoggedInKey, true);
    await _box.write(_userEmailKey, email);
    await _box.write(_userTokenKey, token);
  }

  /// Checks if the user has an active login session.
  bool get isLoggedIn => _box.read<bool>(_isLoggedInKey) ?? false;

  /// Retrieves the stored user email.
  String get userEmail => _box.read<String>(_userEmailKey) ?? '';

  /// Retrieves the stored auth token.
  String get userToken => _box.read<String>(_userTokenKey) ?? '';

  /// Clears all session data (logout).
  Future<void> clearSession() async {
    await _box.remove(_isLoggedInKey);
    await _box.remove(_userEmailKey);
    await _box.remove(_userTokenKey);
  }
}
