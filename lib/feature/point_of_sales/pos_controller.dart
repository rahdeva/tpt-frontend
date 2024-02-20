import 'package:dio/dio.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tpt_frontend/data/remote/dio.dart';
import 'package:tpt_frontend/data/remote/endpoint.dart';
import 'package:tpt_frontend/model/cart_product.dart';
import 'package:tpt_frontend/model/product.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PointOfSalesController extends GetxController {
  static PointOfSalesController find = Get.find();
  final GlobalKey<FormBuilderState> searchformKey = GlobalKey<FormBuilderState>();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  bool isLoading = false;

  Rx<int> page = Rx(1);
  Rx<bool> hasNext = Rx(false);
  Rx<int> pageSize = Rx(12);
  Rx<bool> loadNext = Rx(false);
  Rx<String> searchKeyword = Rx("");

  List<Product> productDataList = [];

  RxList<CartProduct> cartDataList = <CartProduct>[].obs;
  Rx<int> total = Rx(0);

  @override
  void onInit() {
    getAllProduct();
    super.onInit();
  }

  void refreshPage() async {
    productDataList = [];
    searchformKey.currentState?.reset();
    searchKeyword.value = "";
    await getAllProduct();
    update();
    refreshController.refreshCompleted();
  }

  void loadNextPage() async {
    loadNext.value = true;
    hasNext.value = false;
    page.value = page.value + 1;
    await getAllProduct(page: page.value);
    refreshController.loadComplete();
  }

  Future<void> getAllProduct({
    String? keyword,
    int page = 1,
  }) async {
    isLoading = true;
    final dio = await AppDio().getDIO();
    ProductResponse? productResponse;

    try {
      final productData = await dio.get(
        "${BaseUrlLocal.product}?keyword=${keyword ?? ""}&pageSize=${pageSize.value}&page=$page",
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
    update();
  }

  void addProductToCart({
    required int productId, 
    required int eceranId, 
    required int salePrice, 
    required RxInt quantity,
    required int stock,
    required RxInt subTotal,
    required String productName,
    required String image
  }){
    cartDataList.add(
      CartProduct(
        productId: productId,
        productName: productName,
        eceranId: eceranId,
        quantity: quantity,
        salePrice: salePrice,
        subTotal: subTotal,
        stock: stock,
        image: image,
      )
    );
    update();
    updateTotal();
  }

  void deleteCartItem(int index) {
    cartDataList.removeAt(index);
    update();
    updateTotal();
  }

  void deleteAllCartData() {
    cartDataList.clear();
    update();
    updateTotal();
  }

  void addQuantity(mData){
    mData.quantity.value = mData.quantity.value + 1;
    mData.subTotal!.value = mData.quantity!.value * mData.salePrice!;
    update();
    updateTotal();
  }

  void substractQuantity(CartProduct mData){
    if(mData.quantity!.value > 1){
      mData.quantity!.value = mData.quantity!.value - 1;
      mData.subTotal!.value = mData.quantity!.value * mData.salePrice!;
      update();
      updateTotal();
    }
  }

  void updateTotal(){
    total.value = 0;
    for (var cartProduct in cartDataList) {
      total.value += cartProduct.subTotal!.value;
    }
    print("total.value");
    print(total.value);
    for (var cartProduct in cartDataList) {
      print('Product ID: ${cartProduct.productId}');
      print('Product Name: ${cartProduct.productName}');
      print('Eceran ID: ${cartProduct.eceranId}');
      print('Quantity: ${cartProduct.quantity}');
      print('Sale Price: ${cartProduct.salePrice}');
      print('Subtotal: ${cartProduct.subTotal}');
      print('Stock: ${cartProduct.stock}');
      print('Image: ${cartProduct.image}');
      print('\n'); // Add a new line for readability
    }
    update();
  }
}
