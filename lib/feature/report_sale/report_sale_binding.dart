import 'package:tpt_frontend/feature/report_sale/report_sale_controller.dart';
import 'package:get/get.dart';

class SaleReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaleReportController>(
      () => SaleReportController(),
    );
  }
}