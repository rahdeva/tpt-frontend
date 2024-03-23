import 'package:tpt_frontend/feature/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';

class TransactionDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionDashboardController>(
      () => TransactionDashboardController(),
    );
  }
}