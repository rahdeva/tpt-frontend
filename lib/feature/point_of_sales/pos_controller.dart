import 'package:dio/dio.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tpt_frontend/data/remote/dio.dart';
import 'package:tpt_frontend/data/remote/endpoint.dart';
import 'package:tpt_frontend/feature/auth/auth_controller.dart';
import 'package:tpt_frontend/model/cart_product.dart';
import 'package:tpt_frontend/model/product.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tpt_frontend/model/user.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/helper/loading_helper.dart';
import 'package:tpt_frontend/utills/widget/pop_up/pop_up_widget.dart';
import 'package:tpt_frontend/utills/widget/snackbar/snackbar_widget.dart';

class PointOfSalesController extends GetxController {
  static PointOfSalesController find = Get.find();
  final GlobalKey<FormBuilderState> searchformKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> orderFormKey = GlobalKey<FormBuilderState>();
  final purchasingKey = GlobalKey<PaginatedDataTableState>();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  final AuthController authController = AuthController.find;
  UserData? get user => authController.user;
  bool isLoading = false;

  Rx<int> page = Rx(1);
  Rx<bool> hasNext = Rx(false);
  Rx<int> pageSize = Rx(12);
  Rx<bool> loadNext = Rx(false);
  Rx<String> searchKeyword = Rx("");

  List<Product> productDataList = [];

  RxList<CartProduct> cartDataList = <CartProduct>[].obs;
  Rx<int> total = Rx(0);
  List<DataRow> cartDataRowList = [];
  List<Map<String, dynamic>> salesDetail = [];

  @override
  void onInit() {
    getAllProduct();
    super.onInit();
  }

  void refreshPage() async {
    productDataList = [];
    cartDataList.clear();
    total.value = 0;
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
    required String productCode, 
    required String productName,
    required int eceranId, 
    required int salePrice, 
    required RxInt quantity,
    required int stock,
    required RxInt subTotal,
    required String image
  }){
    cartDataList.add(
      CartProduct(
        productId: productId,
        productCode: productCode,
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
    debugPrint("total.value");
    debugPrint(total.value.toString());
    for (var cartProduct in cartDataList) {
      debugPrint('Product ID: ${cartProduct.productId}');
      debugPrint('Product Name: ${cartProduct.productName}');
      debugPrint('Eceran ID: ${cartProduct.eceranId}');
      debugPrint('Quantity: ${cartProduct.quantity}');
      debugPrint('Sale Price: ${cartProduct.salePrice}');
      debugPrint('Subtotal: ${cartProduct.subTotal}');
      debugPrint('Stock: ${cartProduct.stock}');
      debugPrint('Image: ${cartProduct.image}');
      debugPrint('\n'); // Add a new line for readability
    }
    update();
  }

  Future<void> addCartDataRow() async {
    int idx = 0;
    cartDataRowList.clear();
    for(CartProduct item in cartDataList){
      cartDataRowList.add(
        DataRow(
          cells: [
            DataCell(
              Text(
                (idx + 1).toString(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              )
            ),
            DataCell(
              Text(
                item.productCode ?? "-",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              )
            ),
            DataCell(
              Text(
                item.productName ?? "-",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              )
            ),
            DataCell(
              Text(
                NumberFormat.currency(
                  locale: 'id', 
                  decimalDigits: 0,
                  symbol: "Rp "
                ).format(item.salePrice),
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              )
            ),
            DataCell(
              Text(
                item.quantity!.value.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              )
            ),
            DataCell(
              Text(
                NumberFormat.currency(
                  locale: 'id', 
                  decimalDigits: 0,
                  symbol: "Rp "
                ).format(item.subTotal!.value),
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              )
            ),
          ]
        )
      );
      idx++;
    }
    update();
  }

  void addNewSale({
    required DateTime saleDate, 
    required BuildContext context,
  }) async {
    showLoading();
    final dio = await AppDio().getBasicDIO();
    DateTime saleDateUTC8 = saleDate.toUtc().add(const Duration(hours: 0));
    String saleDateValue = saleDateUTC8.toIso8601String();

    salesDetail.clear();
    for (int i = 0; i < cartDataList.length; i++) {
      Map<String, dynamic> saleDetail = {
        "product_id": cartDataList[i].productId,
        "eceran_id": cartDataList[i].eceranId,
        "sale_price": cartDataList[i].salePrice,
        "quantity": cartDataList[i].quantity!.value,
        "subtotal":  cartDataList[i].subTotal!.value,
      };
      salesDetail.add(saleDetail);
    }

    debugPrint("user_id");
    debugPrint(user?.userId.toString());
    debugPrint("saleDateValue");
    debugPrint(saleDateValue);
    debugPrint("total_item");
    debugPrint(salesDetail.length.toString());
    debugPrint("total_price");
    debugPrint(total.value.toString());
    debugPrint("salesDetail");
    print(salesDetail);

    try {
      final saleData = await dio.post(
        BaseUrlLocal.sale,
        data: {
          "user_id" : user?.userId,
          "sale_date": saleDateValue,
          "total_item": salesDetail.length,
          "total_price": total.value,
          "sales_detail": salesDetail,
        },
      );
      debugPrint('Tambah Transaksi: ${saleData.data}');
      dismissLoading();
      Get.back();
      refreshPage();
      // ignore: use_build_context_synchronously
      PopUpWidget.successAndFailPopUp(
        context: context, 
        titleString: "Success!", 
        middleText: "Transaksi berhasil ditambahkan.", 
        buttonText: "OK"
      );
    } on DioError catch (error) {
      dismissLoading();
      SnackbarWidget.defaultSnackbar(
        icon: const Icon(
          Icons.cancel,
          color: AppColors.red,
        ),
        title: "Error!",
        subtitle: "${error.response!.statusCode.toString()} - ${error.response!.statusMessage.toString()}",
      );
      debugPrint(error.toString());
    }
  }
}
