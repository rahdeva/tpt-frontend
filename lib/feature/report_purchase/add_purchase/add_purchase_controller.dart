import 'dart:async';

import 'package:tpt_frontend/data/remote/dio.dart';
import 'package:tpt_frontend/data/remote/endpoint.dart';
import 'package:tpt_frontend/feature/auth/auth_controller.dart';
import 'package:tpt_frontend/model/product_variant.dart';
import 'package:tpt_frontend/model/purchase.dart';
import 'package:tpt_frontend/model/supplier.dart';
import 'package:tpt_frontend/model/user.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/helper/loading_helper.dart';
import 'package:tpt_frontend/utills/widget/button/primary_button.dart';
import 'package:tpt_frontend/utills/widget/forms/text_field_widget.dart';
import 'package:tpt_frontend/utills/widget/pop_up/pop_up_widget.dart';
import 'package:tpt_frontend/utills/widget/snackbar/snackbar_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AddPurchaseReportController extends GetxController {
  final GlobalKey<FormBuilderState> addPurchaseFormKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> searchProductformKey = GlobalKey<FormBuilderState>();
  final tableProductKey = GlobalKey<PaginatedDataTableState>();
  final purchasingKey = GlobalKey<PaginatedDataTableState>();
  final scrollController2 = ScrollController();
  final AuthController authController = AuthController.find;
  UserData? get user => authController.user;
  bool isLoading = false;

  Purchase? purchaseDetail;
  Supplier? supplierChoosen;

  List<ProductVariant> productDataList = [];

  Rx<int> productPage = Rx(1);
  Rx<int> productTotalItems = Rx(0);
  Rx<int> productPageSize = Rx(8);
  Rx<bool> productLoadNext = Rx(false);
  Rx<String> searchProductKeyword = Rx("");

  List<DataRow> purchasingDataList = [];
  List<int> purchaseProductIdDataList = [];
  List<int> purchasePriceDataList = [];
  List<int> totalItemDataList = [];
  RxList<int> subTotalDataList = <int>[].obs;
  List<GlobalKey<FormBuilderState>> purchasingFormKeys = [];
  Rx<int> purchasingIndex = Rx(0);

  List<Map<String, dynamic>> purchasesDetail = [];
  Rx<int> total = Rx(0);  

  @override
  void onInit() {
    supplierChoosen = Get.arguments;
    super.onInit();
  }

  void onProductRowsPerPageChanged(value){
    productPageSize.value = value;
    productPage.value = 1;
    productDataList.clear();
    tableProductKey.currentState?.pageTo(1);
    getAllProducts();
  }

  void onProductPageChanged(value){
    if(value == 1){
      productPage.value = 1;
    } else{
      int productCurrentPage = (value / productPageSize.value).ceil();
      debugPrint('Current Page: ${productPage.value}');
      debugPrint('Next Page: ${productCurrentPage + 1}');
      productPage.value = productCurrentPage + 1;
      productLoadNext.value = true;
    }
    Timer(
      const Duration(seconds: 0), 
      () => scrollController2.animateTo(
        0.0, curve: Curves.easeOut, 
        duration: const Duration(milliseconds: 300)
      ),
    );  
    getAllProducts(page: productPage.value);
  }

  // [READ] Get All Products
  Future<void> getAllProducts({
    String? keyword,
    int page = 1,
  }) async {
    isLoading = true;
    final dio = await AppDio().getDIO();
    ProductVariantResponse? productResponse;

    try {
      final productData = await dio.get(
        "${BaseUrlLocal.productVariant}?keyword=${keyword ?? ""}&pageSize=${productPageSize.value}&page=$productPage",
      );
      debugPrint('Suppliers: ${productData.data}');
      productResponse = ProductVariantResponse.fromJson(productData.data);
      if(productLoadNext.value == true){
        productDataList.addAll(productResponse.data!.productVariant ?? []); 
        productLoadNext.value = false;
      } else{
        productDataList = productResponse.data!.productVariant ?? [];
      }
      productTotalItems.value = productResponse.data!.meta!.totalItems!;
    } on DioError catch (error) {
      debugPrint(error.toString());
    }
    isLoading = false;
    update();
    update(["product-table"]);
  }

  void addPurchasingData(
    ProductVariant choosenProduct
  ) {
    purchasingIndex.value = purchasingDataList.length;
    int idx = purchasingIndex.value;
    purchaseProductIdDataList.insert(idx, choosenProduct.productId ?? 0);
    purchasePriceDataList.insert(idx, choosenProduct.purchasePrice ?? 0);
    totalItemDataList.insert(idx, 1);
    subTotalDataList.insert(idx, choosenProduct.purchasePrice ?? 0);
    updateTotalPrice();
    purchasingFormKeys.insert(idx, GlobalKey<FormBuilderState>());
    purchasingDataList.add(
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
              choosenProduct.productVariantCode ?? "-",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            )
          ),
          DataCell(
            Text(
              choosenProduct.categoryName ?? "-",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            )
          ),
          DataCell(
            Text(
              choosenProduct.productVariantName ?? "-",
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
              ).format(choosenProduct.purchasePrice),
              maxLines: 1,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            )
          ),
          DataCell(
            FormBuilder(
              key: purchasingFormKeys[idx],
              child: Container(
                margin: const EdgeInsets.only(right: 16, top: 4, bottom: 4),
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 2.0,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TextFieldWidget(
                        initialValue: totalItemDataList[idx].toString(),
                        name: 'total-$idx', 
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: false,
                          signed: true,
                        ),
                        onChanged: (value){
                          totalItemDataList[idx]
                            = int.parse(purchasingFormKeys[idx]
                              .currentState!
                              .fields['total-$idx']!
                              .value
                            );
                          subTotalDataList[idx] 
                            = totalItemDataList[idx] * choosenProduct.purchasePrice!;
                          // update(["total-$idx"]);
                          update();
                          updateTotalPrice();
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 38.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: InkWell(
                              child: const Icon(
                                Icons.arrow_drop_up,
                                size: 18.0,
                              ),
                              onTap: () {
                                totalItemDataList[idx] = totalItemDataList[idx] + 1;
                                purchasingFormKeys[idx]
                                  .currentState!
                                  .patchValue({
                                    "total-$idx": totalItemDataList[idx].toString(),
                                  }
                                );
                                subTotalDataList[idx] 
                                  = totalItemDataList[idx] * choosenProduct.purchasePrice!;
                                update();
                                updateTotalPrice();
                              },
                            ),
                          ),
                          InkWell(
                            child: const Icon(
                              Icons.arrow_drop_down,
                              size: 18.0,
                            ),
                            onTap: () {
                              if(totalItemDataList[idx] != 1 && totalItemDataList[idx] != 0){
                                totalItemDataList[idx] = totalItemDataList[idx] - 1;
                                purchasingFormKeys[idx]
                                  .currentState!
                                  .patchValue({
                                    "total-$idx": totalItemDataList[idx].toString(),
                                  }
                                );
                                subTotalDataList[idx] = 
                                  totalItemDataList[idx] * choosenProduct.purchasePrice!;
                                updateTotalPrice();
                              }
                              update();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          DataCell(
            // GetBuilder(
            //   id: "total-$idx",
            //   init: AddPurchaseReportController(),
            //   builder: (_) {
            //     return Text(
            //       NumberFormat.currency(
            //         locale: 'id', 
            //         decimalDigits: 0,
            //         symbol: "Rp "
            //       ).format(subTotalDataList[idx]),
            //       maxLines: 1,
            //       style: const TextStyle(
            //         fontSize: 12,
            //         fontWeight: FontWeight.w500,
            //         color: AppColors.black,
            //       ),
            //     );
            //   }
            // )
            // Text(
            //   "0",
            //   maxLines: 1,
            //   style: const TextStyle(
            //     fontSize: 12,
            //     fontWeight: FontWeight.w500,
            //     color: AppColors.black,
            //   ),
            // )
            Obx(
              () => Text(
                NumberFormat.currency(
                  locale: 'id', 
                  decimalDigits: 0,
                  symbol: "Rp "
                ).format(subTotalDataList[idx]),
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              )
            )
          ),
          DataCell(
            Container(
              margin: const EdgeInsets.all(8),
              child: PrimaryButtonWidget(
                width: 5.w,
                customColors: AppColors.red,
                margin: const EdgeInsets.all(0),
                buttonText: "Delete", 
                withIcon: true,
                icon: const Icon(
                  IconlyLight.delete,
                  color: AppColors.white,
                  size: 16,
                ), 
                onPressed: () {
                  deletePurchasingItem(idx);
                },
              ),
            ),
          ),
        ]
      )
    );
    update();
    update(["purchase-table"]);
    print("purchaseProductIdDataList");
    print(purchaseProductIdDataList);
    print("purchasePriceDataList");
    print(purchasePriceDataList);
    print("totalItemDataList");
    print(totalItemDataList);
    print("subTotalDataList");
    print(subTotalDataList);

    
  }

  void updateTotalPrice(){
    total.value = 0;
    for (int subtotal in subTotalDataList) {
      total.value += subtotal;
    }
    update();
  }

  void updateSubTotal(){
    for (int i = 0; i < subTotalDataList.length; i++) {
      update(["total-$i"]);
    }
  }

  void deletePurchasingItem(int index){
    purchaseProductIdDataList.removeAt(index);
    print("purchaseProductIdDataList");
    print(purchaseProductIdDataList);
    purchasePriceDataList.removeAt(index);
    print("purchasePriceDataList");
    print(purchasePriceDataList);
    totalItemDataList.removeAt(index);
    print("totalItemDataList");
    print(totalItemDataList);
    subTotalDataList.removeAt(index);
    print("subTotalDataList");
    print(subTotalDataList);
    purchasingFormKeys.removeAt(index);
    purchasingDataList.removeAt(index);
    // updateSubTotal();
    update(["purchase-table"]);
    updateTotalPrice();
    update();
  }

  // [CREATE] Add New Purchase
  void addNewPurchase({
    required DateTime purchaseDate, 
    required BuildContext context,
  }) async {
    showLoading();
    final dio = await AppDio().getBasicDIO();
    DateTime purchaseDateUTC8 = purchaseDate.toUtc().add(const Duration(hours: 0));
    String purchaseDateValue = purchaseDateUTC8.toIso8601String();

    purchasesDetail.clear();
    for (int i = 0; i < purchaseProductIdDataList.length; i++) {
      Map<String, dynamic> purchaseDetail = {
        "product_variant_id": purchaseProductIdDataList[i],
        "purchase_price": purchasePriceDataList[i],
        "quantity": totalItemDataList[i],
        "subtotal": subTotalDataList[i]
      };
      purchasesDetail.add(purchaseDetail);
    }

    print("user_id");
    print(user?.userId);
    print("purchaseDateValue");
    print(purchaseDateValue);
    print("supplierChoosen?.supplierId");
    print(supplierChoosen?.supplierId);
    print("total_item");
    print(purchasingDataList.length);
    print("total_price");
    print(total.value);
    print("purchasesDetail");
    print(purchasesDetail);

    try {
      final purchaseData = await dio.post(
        BaseUrlLocal.purchase,
        data: {
          "user_id" : user?.userId,
          "supplier_id": supplierChoosen?.supplierId,
          "purchase_date": purchaseDateValue,
          "total_item": purchasingDataList.length,
          "total_price": total.value,
          "purchases_detail": purchasesDetail,
        },
      );
      debugPrint('Tambah Laporan: ${purchaseData.data}');
      dismissLoading();
      Get.back();
      // ignore: use_build_context_synchronously
      PopUpWidget.successAndFailPopUp(
        context: context, 
        titleString: "Success!", 
        middleText: "Laporan berhasil ditambahkan.", 
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