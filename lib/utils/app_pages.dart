import 'package:get/get.dart';
import 'package:shoe_size/src/change_language/view/change_language_screen.dart';
import 'package:shoe_size/src/dashboard/view/dashboard_screen.dart';
import 'package:shoe_size/src/how_to_calculate/view/how_to_calculate_shoe_size_screen.dart';
import 'package:shoe_size/src/settings/view/settings_screen.dart';
import 'package:shoe_size/src/shoe_size_chart/view/shoes_size_chart_screen.dart';
import 'app_routes.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(
        name: AppRoutes.routeDashboard,
        page: () => const DashboardScreen()),
    GetPage(
        name: AppRoutes.routeHowToCalculateShoeSize,
        page: () => const HowToCalculateShoeSizeScreen()),
    GetPage(name: AppRoutes.routeSettings, page: () => const SettingsScreen()),
    GetPage(
        name: AppRoutes.routeChangeLanguage,
        page: () => const ChangeLanguageScreen()),
    GetPage(
        name: AppRoutes.routeShoeSizeChart,
        page: () => const ShoeSizeChartScreen()),
  ];
}
