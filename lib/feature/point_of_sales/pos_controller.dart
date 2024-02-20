import 'package:dio/dio.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tpt_frontend/data/remote/dio.dart';
import 'package:tpt_frontend/data/remote/endpoint.dart';
import 'package:tpt_frontend/model/product.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../main/main_controller.dart';

class PointOfSalesController extends GetxController {
  static PointOfSalesController find = Get.find();
  final MainController mainC = MainController.find;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;

  Rx<int> page = Rx(1);
  Rx<bool> hasNext = Rx(false);
  Rx<bool> loadNext = Rx(false);

  List<Product> productDataList = [];
  List<Product> cartDataList = [];

  @override
  void onInit() {
    getAllProduct();
    super.onInit();
  }

  void refreshPage() async {
    productDataList = [];
    getAllProduct();
    formKey.currentState!.reset();
    update();
    refreshController.refreshCompleted();
  }

  void loadNextPage() {
    loadNext.value = true;
    hasNext.value = false;
    page.value = page.value + 1;
    getAllProduct(page: page.value);
    refreshController.loadComplete();
  }

  void getAllProduct({
    String? searchKeyword,
    int page = 1,
    int pageSize = 12
  }) async {
    isLoading = true;
    final dio = await AppDio().getDIO();
    ProductResponse? productResponse;

    try {
      final productData = await dio.get(
        "${BaseUrlLocal.product}?keyword=${searchKeyword ?? ""}&pageSize=$pageSize&page=$page",
      );
      debugPrint('Products: ${productData.data}');
      productResponse = ProductResponse.fromJson(productData.data);
      if(loadNext.value == true){
        productDataList.addAll(productResponse.data!.product ?? []); 
        loadNext.value = false;
      } else{
        productDataList = productResponse.data!.product ?? [];
      }
      hasNext.value = productResponse.data!.meta!.page! < productResponse.data!.meta!.totalPage!;
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    debugPrint("hasNext.value");
    debugPrint(hasNext.value.toString());
    update();
  }
}
