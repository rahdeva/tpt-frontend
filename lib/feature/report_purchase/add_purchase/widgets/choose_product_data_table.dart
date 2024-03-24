import 'package:intl/intl.dart';
import 'package:tpt_frontend/feature/report_purchase/add_purchase/add_purchase_controller.dart';
import 'package:tpt_frontend/model/product_variant.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/widget/button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChooseProductDataSource extends DataTableSource {
  ChooseProductDataSource({
    required this.data,
    required this.controller,
    required this.context,
  });
  
  final List<ProductVariant> data;
  final AddPurchaseReportController controller;
  final BuildContext context;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.productTotalItems.value;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final item = data[index];

    return DataRow(
      cells: [
        DataCell(
          Text(
            (index + 1).toString(),
            style: Theme.of(context).textTheme.bodyMedium
          )
        ),
        DataCell(
          Text(
            item.productVariantCode ?? "-",
            style: Theme.of(context).textTheme.bodyMedium
          )
        ),
        DataCell(
          Text(
            item.categoryName ?? "-",
            style: Theme.of(context).textTheme.bodyMedium
          )
        ),
        DataCell(
          Text(
            item.productVariantName ?? "-",
            style: Theme.of(context).textTheme.bodyMedium
          )
        ),
        DataCell(
          Text(
            item.brand == null || item.brand == ""
            ? "-"
            : item.brand!,
            style: Theme.of(context).textTheme.bodyMedium
          )
        ),
        DataCell(
          Text(
            NumberFormat.currency(
              locale: 'id', 
              decimalDigits: 0,
              symbol: "Rp "
            ).format(item.purchasePrice),
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyMedium
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
            style: Theme.of(context).textTheme.bodyMedium
          )
        ),
        DataCell(
          Text(
            item.variantStock == null
            ? "-"
            : item.variantStock.toString(),
            style: Theme.of(context).textTheme.bodyMedium
          )
        ),
        DataCell(
          Container(
            margin: const EdgeInsets.all(8),
            child: PrimaryButtonWidget(
              width: 5.w,
              customColors: AppColors.primary,
              margin: const EdgeInsets.all(0),
              buttonText: "Pilih", 
              withIcon: true,
              icon: const FaIcon(
                FontAwesomeIcons.squareCheck,
                color: AppColors.white,
                size: 16,
              ),
              onPressed: () {
                // controller.addPurchasingData(item);
                Get.back();
              },
            ),
          ),
        ),
      ]
    );
  }
}