import 'package:tpt_frontend/feature/report_purchase/report_purchase_controller.dart';
import 'package:get/get.dart';

class PurchaseReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseReportController>(
      () => PurchaseReportController(),
    );
  }
}