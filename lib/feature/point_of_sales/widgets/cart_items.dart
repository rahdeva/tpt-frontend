import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';
import 'package:tpt_frontend/feature/point_of_sales/pos_controller.dart';
import 'package:tpt_frontend/model/cart_product.dart';
import '/resources/resources.dart';
import 'package:sizer/sizer.dart';

class CartListItem extends StatelessWidget {
  final int index;
  final PointOfSalesController controller;
  final CartProduct mData;

  const CartListItem({
    Key? key, 
    required this.index, 
    required this.controller, 
    required this.mData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          Container(
            height: 68,
            width: 68,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(mData.image ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mData.productName ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  NumberFormat.currency(
                    locale: 'id', 
                    decimalDigits: 0,
                    symbol: "Rp "
                  ).format(mData.subTotal!.value),
                  // NumberFormat.currency(
                  //   locale: 'id', 
                  //   decimalDigits: 0,
                  //   symbol: "Rp "
                  // ).format(mData.salePrice),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        controller.addQuantity(mData);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: const Icon(
                          Icons.add, 
                          size: 20,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      mData.quantity!.value.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: (){
                        controller.substractQuantity(mData);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: const Icon(
                          Icons.remove, 
                          size: 20,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 4),
                // Text(
                //   "SubTotal : ${NumberFormat.currency(
                //     locale: 'id', 
                //     decimalDigits: 0,
                //     symbol: "Rp "
                //   ).format(mData.subTotal!.value)}",
                //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                //     color: AppColors.black,
                //     fontWeight: FontWeight.w500
                //   ),
                // ),
              ],
            ),
          ),
          IconButton(
            onPressed: (){
              controller.deleteCartItem(index);
            },
            icon: const Icon(
              IconlyLight.delete,
              size: 16,
              color: AppColors.red,
            ),
          )
        ],
      ),
    );
  }
}