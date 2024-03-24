import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:tpt_frontend/feature/point_of_sales/pos_controller.dart';
import 'package:tpt_frontend/model/product_variant.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/helper/static_value_helper.dart';

class POSProductListItem extends StatelessWidget {
  final int index;
  final PointOfSalesController controller;
  final ProductVariant mData;

  const POSProductListItem({
    Key? key, 
    required this.index, 
    required this.controller, 
    required this.mData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print(mData);
        if(mData.variantStock != 0){
          controller.addProductToCart(
            productVariantId: mData.productId!,
            productId: mData.productId!,
            variantName: mData.variantName!,
            brand: mData.brand!,
            categoryId: mData.categoryId!,
            categoryName: mData.categoryName!,
            productQuantity: mData.productQuantity!,
            productVariantCode: mData.productVariantCode!,
            productVariantName: mData.productVariantName!,
            salePrice: mData.salePrice!,
            purchasePrice: mData.productId!,
            variantStock: mData.variantStock!,
            image: mData.image!, 
            quantity: 1.obs,
            subTotal: mData.salePrice!.obs,
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 168,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(mData.image ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                mData.variantStock == 0
                ? Container(
                    height: 168,
                    width: 100.w,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: AppColors.gray700,
                    ),
                  )
                : const SizedBox(),
                mData.variantStock == 0
                ? Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 72),
                      width: 5.w,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text(
                        "Sold Out",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          color: AppColors.background2,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                )
                : const SizedBox(),
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Text(
                          mData.brand == null || mData.brand == "" 
                          ? "-"
                          : mData.brand!,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 10,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Text(
                          mData.variantStock.toString(),
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 10,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.background2,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text(
                        StaticValueHelper.productCategoryList[mData.categoryId]!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 10,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    NumberFormat.currency(
                      locale: 'id', 
                      decimalDigits: 0,
                      symbol: "Rp "
                    ).format(mData.salePrice),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 12,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    mData.productVariantName ?? "-",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 12,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}