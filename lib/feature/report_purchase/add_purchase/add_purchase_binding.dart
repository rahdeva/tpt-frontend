import 'package:tpt_frontend/feature/report_purchase/add_purchase/add_purchase_controller.dart';
import 'package:get/get.dart';

class AddPurchaseReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPurchaseReportController>(
      () => AddPurchaseReportController(),
    );
  }
}