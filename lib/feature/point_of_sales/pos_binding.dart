import 'package:get/get.dart';
import 'package:tpt_frontend/feature/point_of_sales/pos_controller.dart';

class PointOfSalesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PointOfSalesController>(
      () => PointOfSalesController(),
    );
  }
}