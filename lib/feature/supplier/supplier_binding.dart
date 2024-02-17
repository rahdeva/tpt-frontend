import 'package:tpt_frontend/feature/supplier/supplier_controller.dart';
import 'package:get/get.dart';

class SupplierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupplierController>(
      () => SupplierController(),
    );
  }
}