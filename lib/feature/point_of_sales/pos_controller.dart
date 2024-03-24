import 'package:dio/dio.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tpt_frontend/data/remote/dio.dart';
import 'package:tpt_frontend/data/remote/endpoint.dart';
import 'package:tpt_frontend/feature/auth/auth_controller.dart';
import 'package:tpt_frontend/model/cart_product.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tpt_frontend/model/product_variant.dart';
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
  Rx<int> pageSize = Rx(80);
  Rx<bool> loadNext = Rx(false);
  Rx<String> searchKeyword = Rx("");

  List<ProductVariant> productDataList = [];

  RxList<CartProduct> cartDataList = <CartProduct>[].obs;
  Rx<int> total = Rx(0);
  List<DataRow> cartDataRowList = [];
  List<Map<String, dynamic>> salesDetail = [];

  @override
  void onInit() {
    getAllProductVariant();
    super.onInit();
  }

  void refreshPage() async {
    productDataList = [];
    // cartDataList.clear();
    // total.value = 0;
    searchformKey.currentState?.reset();
    searchKeyword.value = "";
    await getAllProductVariant();
    update();
    refreshController.refreshCompleted();
  }

  void loadNextPage() async {
    loadNext.value = true;
    hasNext.value = false;
    page.value = page.value + 1;
    await getAllProductVariant(page: page.value);
    refreshController.loadComplete();
  }

  Future<void> getAllProductVariant({
    String? keyword,
    int page = 1,
  }) async {
    isLoading = true;
    final dio = await AppDio().getDIO();
    ProductVariantResponse? productResponse;

    try {
      final productData = await dio.get(
        "${BaseUrlLocal.productVariant}?keyword=${keyword ?? ""}&pageSize=${pageSize.value}&page=$page",
      );
      debugPrint('Products: ${productData.data}');
      productResponse = ProductVariantResponse.fromJson(productData.data);
      if(loadNext.value == true){
        productDataList.addAll(productResponse.data!.productVariant ?? []); 
        loadNext.value = false;
      } else{
        productDataList = productResponse.data!.productVariant ?? [];
      }
      hasNext.value = productResponse.data!.meta!.page! < productResponse.data!.meta!.totalPage!;
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
  }

  void addProductToCart({
    required int productVariantId,
    required int productId,
    required int categoryId,
    required String categoryName,
    required String variantName,
    required String productVariantCode,
    required String productVariantName,
    required int productQuantity,
    required int purchasePrice,
    required int salePrice,
    required String image,
    required String brand,
    required int variantStock,
    required RxInt quantity,
    required RxInt subTotal,
  }){
    cartDataList.add(
      CartProduct(
        productVariantId: productVariantId,
        productId: productId,
        categoryId: categoryId,
        categoryName: categoryName,
        variantName: variantName,
        productVariantCode: productVariantCode,
        productVariantName: productVariantName,
        productQuantity: productQuantity,
        purchasePrice: purchasePrice,
        salePrice: salePrice,
        image: image,
        brand: brand,
        variantStock: variantStock,
        quantity: quantity,
        subTotal: subTotal
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
    total.value = 0;
    update();
    updateTotal();
  }

  void addQuantity(CartProduct mData){
    print(mData.quantity!.value);
    print(mData.variantStock);
    if(mData.quantity!.value < mData.variantStock!){
      mData.quantity!.value = mData.quantity!.value + 1;
      mData.subTotal!.value = mData.quantity!.value * mData.salePrice!;
      update();
      updateTotal();
    }
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
    // for (var cartProduct in cartDataList) {
    //   debugPrint('Product ID: ${cartProduct.productId}');
    //   debugPrint('Product Name: ${cartProduct.productName}');
    //   debugPrint('Eceran ID: ${cartProduct.eceranId}');
    //   debugPrint('Quantity: ${cartProduct.quantity}');
    //   debugPrint('Sale Price: ${cartProduct.salePrice}');
    //   debugPrint('Subtotal: ${cartProduct.subTotal}');
    //   debugPrint('Stock: ${cartProduct.stock}');
    //   debugPrint('Image: ${cartProduct.image}');
    //   debugPrint('\n'); // Add a new line for readability
    // }
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
                item.productVariantCode ?? "-",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              )
            ),
            DataCell(
              Text(
                item.productVariantName ?? "-",
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
        "product_variant_id": cartDataList[i].productVariantId,
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
