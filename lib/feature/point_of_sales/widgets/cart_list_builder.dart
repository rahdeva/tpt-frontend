import 'package:flutter/material.dart';
import 'package:tpt_frontend/feature/point_of_sales/pos_controller.dart';
import 'package:tpt_frontend/feature/point_of_sales/widgets/cart_items.dart';

class CartListBuilder extends StatelessWidget {
  const CartListBuilder({
    Key? key, 
    required this.controller, 
  }) : super(key: key);

  final PointOfSalesController controller;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: ListView.separated(
        itemCount: controller.productDataList.length,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 12);
        },
        padding: const EdgeInsets.only(bottom: 24, right: 24),
        itemBuilder: (context, index) {
          return CartListItem(
            index: index,
            controller: controller,
            mData: controller.productDataList[index],
          );
        },
      ),
    );
  }
}
