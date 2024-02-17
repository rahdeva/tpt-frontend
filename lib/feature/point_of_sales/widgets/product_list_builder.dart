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
    return ListView.separated(
      itemCount: controller.dataList.length,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      padding: const EdgeInsets.only(bottom: 24),
      itemBuilder: (context, index) {
        return POSProductListItem(
          index: index,
          controller: controller,
          mData: controller.dataList[index],
        );
      },
    );
  }
}
