import 'package:tpt_frontend/feature/category/category_controller.dart';
import 'package:tpt_frontend/feature/dashboard_financial/dashboard_financial_controller.dart';
import 'package:tpt_frontend/feature/dashboard_forecasting/dashboard_forecasting_controller.dart';
import 'package:tpt_frontend/feature/dashboard_transaction/dashboard_transaction_controller.dart';
import 'package:tpt_frontend/feature/history/history_controller.dart';
import 'package:tpt_frontend/feature/home/home_controller.dart';
import 'package:tpt_frontend/feature/point_of_sales/pos_controller.dart';
import 'package:tpt_frontend/feature/product/product_controller.dart';
import 'package:tpt_frontend/feature/report_financial/report_financial_controller.dart';
import 'package:tpt_frontend/feature/report_purchase/report_purchase_controller.dart';
import 'package:tpt_frontend/feature/report_sale/report_sale_controller.dart';
import 'package:tpt_frontend/feature/setting/setting_controller.dart';
import 'package:tpt_frontend/feature/supplier/supplier_controller.dart';
import 'package:tpt_frontend/feature/user/user_controller.dart';
import 'package:get/get.dart';

typedef BindingCreator<S extends Bindings> = S Function();

class Utils {
  Utils._();

  static late final List<BindingCreator<Bindings>> _sideMenuBindings;

  static void initializedSideMenu({
    required List<Bindings> bindings
  }) {
    _sideMenuBindings = bindings.map(
      (binding) => () => binding
    ).toList();
  }

  static void loadSideMenuBinding(int index) async {
    final bindingCreator = _sideMenuBindings[index].call();
    bindingCreator.dependencies();
  }

  static void unloadSideMenuBinding(int index) async {
    switch (index) {
      case 0:
        Get.delete<HomeController>();
        break;
      case 1:
        Get.delete<SettingController>();
        break;
      case 2:
        Get.delete<PointOfSalesController>();
        break;
      case 3:
        Get.delete<HistoryController>();
        break;
      case 4:
        Get.delete<ProductController>();
        break;
      case 5:
        Get.delete<CategoryController>();
        break;
      case 6:
        Get.delete<SupplierController>();
        break;
      case 7:
        Get.delete<UserController>();
        break;
      case 8:
        Get.delete<SaleReportController>();
        break;
      case 9:
        Get.delete<PurchaseReportController>();
        break;
      case 10:
        Get.delete<FinancialReportController>();
        break;
      case 11:
        Get.delete<TransactionDashboardController>();
        break;
      case 12:
        Get.delete<FinancialDashboardController>();
        break;
      case 13:
        Get.delete<ForecastingDashboardController>();
        break;
      default:
    }
  }

  static void closeSideMenu(int index) {
    final bindingCreator = _sideMenuBindings[index].call();
    bindingCreator.dependencies();
  }
}