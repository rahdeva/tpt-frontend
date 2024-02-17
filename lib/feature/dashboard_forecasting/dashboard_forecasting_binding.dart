import 'package:tpt_frontend/feature/dashboard_forecasting/dashboard_forecasting_controller.dart';
import 'package:get/get.dart';

class ForecastingDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForecastingDashboardController>(
      () => ForecastingDashboardController(),
    );
  }
}