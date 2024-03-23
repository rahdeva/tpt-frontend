import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:tpt_frontend/data/remote/dio.dart';
import 'package:tpt_frontend/data/remote/endpoint.dart';
import 'package:tpt_frontend/model/dashboard/financial/dashboard_cash_in.dart';
import 'package:tpt_frontend/model/dashboard/financial/dashboard_cash_out.dart';
import 'package:tpt_frontend/model/dashboard/financial/dashboard_cashflow.dart';
import 'package:tpt_frontend/model/dashboard/financial/dashboard_total_cash_by_type.dart';
import 'package:tpt_frontend/model/dashboard/purchase/dashboard_purchase_total_transaction.dart';
import 'package:tpt_frontend/model/dashboard/purchase/dashboard_top_supplier.dart';
import 'package:tpt_frontend/model/dashboard/purchase/dashboard_total_item_purchased.dart';
import 'package:tpt_frontend/model/dashboard/purchase/dashboard_total_purchase.dart';
import 'package:tpt_frontend/model/dashboard/sale/dashboard_sale_total_transaction.dart';
import 'package:tpt_frontend/model/dashboard/sale/dashboard_top_sale_product.dart';
import 'package:tpt_frontend/model/dashboard/sale/dashboard_total_item_sold.dart';
import 'package:tpt_frontend/model/dashboard/sale/dashboard_total_profit.dart';
import 'package:tpt_frontend/model/dashboard/sale/dashboard_total_sales.dart';
import 'package:tpt_frontend/model/dashboard/summary/dashboard_product_by_category.dart';
import 'package:tpt_frontend/model/dashboard/summary/dashboard_top_expensive_product.dart';
import 'package:tpt_frontend/model/dashboard/summary/dashboard_top_stock_product.dart';

class TransactionDashboardController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final tableKey = GlobalKey<PaginatedDataTableState>();
  final scrollController = ScrollController();
  bool isLoading = false;

  // Summary
  DashboardProductByCategory? productByCategory;
  DashboardTopStockProduct? topStockProduct;
  DashboardTopExpensiveProduct? topExpensiveProduct;

  // Sale
  DashboardSaleTotalTransaction? saleTotalTransaction;
  DashboardSaleTotalSales? saleTotalSales;
  DashboardTotalItemSold? totalItemSold;
  DashboardTotalProfit? totalProfit;
  DashboardTopSaleProduct? topSaleProduct;

  // Purchase
  DashboardPurchaseTotalTransactions? purchaseTotalTransactions;
  DashboardTotalPurchase? totalPurchase;
  DashboardTotalItemPurchased? totalItemPurchased;
  DashboardTopSupplier? topSupplier;

  // Financial
  DashboardCashFlow? cashFlow;
  DashboardTotalCashByType? totalCashByType;
  DashboardCashIn? cashIn;
  DashboardCashOut? cashOut;

  get c => null;

  @override
  void onInit() {
    getProductByCategory();
    getTopStockProduct();
    getTopExpensiveProduct();
    getSaleTotalTransaction();
    getSaleTotalSales();
    getTotalItemSold();
    getTotalProfit();
    getTopSaleProduct();
    getPurchaseTotalTransactions();
    getTotalPurchase();
    getTotalItemPurchased();
    getTopSupplier();
    getCashFlow();
    getTotalCashByType();
    getCashIn();
    getCashOut();
    super.onInit();
  }

  void getProductByCategory() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final homeResponseData = await dio.get(
        BaseUrlLocal.dashboardProductByCategory,
      );
      debugPrint('Home : ${homeResponseData.data}');
      productByCategory = DashboardProductByCategory.fromJson(homeResponseData.data);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getTopStockProduct() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final homeResponseData = await dio.get(
        BaseUrlLocal.dashboardTopStockProduct,
      );
      debugPrint('Home : ${homeResponseData.data}');
      topStockProduct = DashboardTopStockProduct.fromJson(homeResponseData.data);
      print(topStockProduct);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getTopExpensiveProduct() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final homeResponseData = await dio.get(
        BaseUrlLocal.dashboardTopExpensiveProduct,
      );
      debugPrint('Home : ${homeResponseData.data}');
      topExpensiveProduct = DashboardTopExpensiveProduct.fromJson(homeResponseData.data);
      print(topExpensiveProduct);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getSaleTotalTransaction() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final response = await dio.get(
        BaseUrlLocal.dashboardTotalSaleTransactions,
      );
      saleTotalTransaction = DashboardSaleTotalTransaction.fromJson(response.data);
      print(saleTotalTransaction);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getSaleTotalSales() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final response = await dio.get(
        BaseUrlLocal.dashboardTotalSales,
      );
      saleTotalSales = DashboardSaleTotalSales.fromJson(response.data);
      print(saleTotalSales);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getTotalItemSold() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final response = await dio.get(
        BaseUrlLocal.dashboardTotalItemSold,
      );
      totalItemSold = DashboardTotalItemSold.fromJson(response.data);
      print(totalItemSold);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getTotalProfit() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final response = await dio.get(
        BaseUrlLocal.dashboardTotalProfit,
      );
      totalProfit = DashboardTotalProfit.fromJson(response.data);
      print(totalProfit);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getTopSaleProduct() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final response = await dio.get(
        BaseUrlLocal.dashboardTopSaleProduct,
      );
      topSaleProduct = DashboardTopSaleProduct.fromJson(response.data);
      print(topSaleProduct);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getPurchaseTotalTransactions() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final response = await dio.get(
        BaseUrlLocal.dashboardTotalPurchaseTransactions,
      );
      purchaseTotalTransactions = DashboardPurchaseTotalTransactions.fromJson(response.data);
      print(purchaseTotalTransactions);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getTotalPurchase() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final response = await dio.get(
        BaseUrlLocal.dashboardTotalPurchase,
      );
      totalPurchase = DashboardTotalPurchase.fromJson(response.data);
      print(totalPurchase);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getTotalItemPurchased() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final response = await dio.get(
        BaseUrlLocal.dashboardTotalItemPurchased,
      );
      totalItemPurchased = DashboardTotalItemPurchased.fromJson(response.data);
      print(totalItemPurchased);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getTopSupplier() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final response = await dio.get(
        BaseUrlLocal.dashboardTopSupplier,
      );
      topSupplier = DashboardTopSupplier.fromJson(response.data);
      print(topSupplier);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getCashFlow() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final response = await dio.get(
        BaseUrlLocal.dashboardCashFlow,
      );
      cashFlow = DashboardCashFlow.fromJson(response.data);
      print(cashFlow);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getTotalCashByType() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final response = await dio.get(
        BaseUrlLocal.dashboardCashByType,
      );
      totalCashByType = DashboardTotalCashByType.fromJson(response.data);
      print(totalCashByType);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getCashIn() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final response = await dio.get(
        BaseUrlLocal.dashboardCashIn,
      );
      cashIn = DashboardCashIn.fromJson(response.data);
      print(cashIn);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void getCashOut() async {
    isLoading = true;
    final dio = await AppDio().getBasicDIO();

    try {
      final response = await dio.get(
        BaseUrlLocal.dashboardCashOut,
      );
      cashOut = DashboardCashOut.fromJson(response.data);
      print(cashOut);
      update();
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }
}