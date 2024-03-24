import 'package:tpt_frontend/feature/point_of_sales/pos_controller.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/widget/table/data_column_widget.dart';
import 'package:flutter/material.dart';

class OrderTableWidget extends StatelessWidget {
  const OrderTableWidget({
    super.key,
    required this.controller
  });

  final PointOfSalesController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.only(right: 0),
      width: double.infinity,
      child: Theme(
        data: ThemeData(
          cardTheme: Theme.of(context).cardTheme,
          textTheme: Theme.of(context).textTheme.copyWith(
            bodySmall: Theme.of(context).textTheme.titleSmall,
          )
        ),
        child: DataTable(
          key: controller.purchasingKey,
          columnSpacing : 0,
          headingRowHeight: 46,
          headingRowColor: MaterialStateProperty.resolveWith(
            (states) => AppColors.primary
          ),
          dataRowColor: MaterialStateColor.resolveWith(
            (states) => Colors.white
          ),
          rows: controller.cartDataRowList,
          columns: [
            dataColumnWidget(
              context, labelText: "No"
            ),
            dataColumnWidget(
              context, labelText: "Kode Produk"
            ),
            dataColumnWidget(
              context, labelText: "Nama Varian Produk"
            ),
            dataColumnWidget(
              context, labelText: "Harga"
            ),
            dataColumnWidget(
              context, labelText: "Jumlah"
            ),
            dataColumnWidget(
              context, labelText: "SubTotal"
            ),
          ],
        ),
      ),
    );
  }
}
