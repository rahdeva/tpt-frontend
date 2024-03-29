import 'package:flutter/material.dart';
import 'package:tpt_frontend/feature/point_of_sales/pos_controller.dart';
import 'package:tpt_frontend/feature/point_of_sales/widgets/product_items.dart';

class POSProductBuilder extends StatelessWidget {
  const POSProductBuilder({
    Key? key, 
    required this.controller, 
  }) : super(key: key);

  final PointOfSalesController controller;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          childAspectRatio: 0.675
        ),
        itemCount: controller.productDataList.length,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(right: 24),
        itemBuilder: (context, index) {
          return POSProductListItem(
            index: index,
            controller: controller,
            mData: controller.productDataList[index],
          );
        },
      ),
    );
  }
}
