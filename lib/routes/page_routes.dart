import 'package:tpt_frontend/feature/category/category_binding.dart';
import 'package:tpt_frontend/feature/category/category_page.dart';
import 'package:tpt_frontend/feature/dashboard/dashboard_binding.dart';
import 'package:tpt_frontend/feature/history/history_binding.dart';
import 'package:tpt_frontend/feature/history/history_page.dart';
import 'package:tpt_frontend/feature/home/home_binding.dart';
import 'package:tpt_frontend/feature/point_of_sales/pos_binding.dart';
import 'package:tpt_frontend/feature/point_of_sales/pos_page.dart';
import 'package:tpt_frontend/feature/product/product_binding.dart';
import 'package:tpt_frontend/feature/product/product_page.dart';
import 'package:tpt_frontend/feature/report_financial/report_financial_binding.dart';
import 'package:tpt_frontend/feature/report_financial/report_financial_page.dart';
import 'package:tpt_frontend/feature/report_purchase/add_purchase/add_purchase_binding.dart';
import 'package:tpt_frontend/feature/report_purchase/add_purchase/add_purchase_page.dart';
import 'package:tpt_frontend/feature/report_purchase/report_purchase_binding.dart';
import 'package:tpt_frontend/feature/report_purchase/report_purchase_page.dart';
import 'package:tpt_frontend/feature/report_sale/report_sale_binding.dart';
import 'package:tpt_frontend/feature/report_sale/report_sale_page.dart';
import 'package:tpt_frontend/feature/setting/setting_binding.dart';
import 'package:tpt_frontend/feature/supplier/supplier_binding.dart';
import 'package:tpt_frontend/feature/supplier/supplier_page.dart';
import 'package:tpt_frontend/feature/user/user_binding.dart';
import 'package:tpt_frontend/feature/user/user_page.dart';
import 'package:get/get.dart';
import 'package:tpt_frontend/feature/main/main_binding.dart';
import 'package:tpt_frontend/feature/main/main_page.dart';
import 'package:tpt_frontend/feature/home/home_page.dart';
import 'package:tpt_frontend/feature/setting/setting_page.dart';
import '/feature/loader/loading_page.dart';
import '/feature/login/login_binding.dart';
import '/feature/login/login_page.dart';

import 'page_names.dart';

class PageRoutes {
  static final sideMenuBindings = [
    HomeBinding(),
    SettingBinding(),
    PointOfSalesBinding(),
    HistoryBinding(),
    ProductBinding(),
    CategoryBinding(),
    SupplierBinding(),
    UserBinding(),
    SaleReportBinding(),
    PurchaseReportBinding(),
    FinancialReportBinding(),
    TransactionDashboardBinding(),
  ];

  static final pages = [
    GetPage(
      name: PageName.LOADER,
      page: () => const LoadingPage(),
    ),
    GetPage(
      name: PageName.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: PageName.MAIN,
      page: () => const MainPage(),
      binding: MainBinding()
    ),
    GetPage(
      name: PageName.HOME,
      page: () => const HomePage(),
      binding: HomeBinding()
    ),
    GetPage(
      name: PageName.SETTING,
      page: () => const SettingPage(),
      binding: SettingBinding()
    ),
    GetPage(
      name: PageName.PRODUCT,
      page: () => const ProductPage(),
      binding: ProductBinding()
    ),
    GetPage(
      name: PageName.CATEGORY,
      page: () => const CategoryPage(),
      binding: CategoryBinding()
    ),
    GetPage(
      name: PageName.SUPPLIER,
      page: () => const SupplierPage(),
      binding: SupplierBinding()
    ),
    GetPage(
      name: PageName.USER,
      page: () => const UserPage(),
      binding: UserBinding()
    ),
    GetPage(
      name: PageName.REPORT_SALE,
      page: () => const SaleReportPage(),
      binding: SaleReportBinding()
    ),
    GetPage(
      name: PageName.REPORT_PURCHASE,
      page: () => const PurchaseReportPage(),
      binding: PurchaseReportBinding()
    ),
    GetPage(
      name: PageName.ADD_REPORT_PURCHASE,
      page: () => const AddPurchaseReportPage(),
      binding: AddPurchaseReportBinding()
    ),
    GetPage(
      name: PageName.REPORT_FINANCIAL,
      page: () => const FinancialReportPage(),
      binding: FinancialReportBinding()
    ),
    // GetPage(
    //   name: PageName.DASHBOARD_TRANSACTION,
    //   page: () => const TransactionDashboardPage(),
    //   binding: TransactionDashboardBinding()
    // ),
    GetPage(
      name: PageName.POINTOFSALES,
      page: () => const PointOfSalesPage(),
      binding: PointOfSalesBinding()
    ),
    GetPage(
      name: PageName.HISTORY,
      page: () => const HistoryPage(),
      binding: HistoryBinding()
    ),
  ];
}
