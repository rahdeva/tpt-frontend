import 'package:tpt_frontend/feature/report_financial/report_financial_controller.dart';
import 'package:get/get.dart';

class FinancialReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinancialReportController>(
      () => FinancialReportController(),
    );
  }
}