import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/services/api_service.dart';
import 'core/services/storage_service.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

/// Application entry point.
/// Initializes GetStorage, registers global services,
/// and launches the GetMaterialApp.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local storage
  await GetStorage.init();

  // Register global services (available throughout the app)
  Get.put<StorageService>(StorageService(), permanent: true);
  Get.put<ApiService>(ApiService(), permanent: true);

  runApp(const GetXMvcApp());
}

/// Root widget of the application.
class GetXMvcApp extends StatelessWidget {
  const GetXMvcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX MVC App',
      debugShowCheckedModeBanner: false,

      // ─── Theme ───
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,

      // ─── Routing ───
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,

      // ─── Default Transition ───
      defaultTransition: Transition.cupertino,
    );
  }
}
