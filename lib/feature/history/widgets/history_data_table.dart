import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tpt_frontend/feature/history/history_controller.dart';
import 'package:tpt_frontend/feature/history/widgets/view_report_sale_detail.dart';
import 'package:tpt_frontend/model/sale.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/widget/button/primary_button.dart';
import 'package:sizer/sizer.dart';

class SalesHistoryDataSource extends DataTableSource {
  SalesHistoryDataSource({
    required this.data,
    required this.controller,
    required this.context,
  });
  
  final List<Sale> data;
  final HistoryController controller;
  final BuildContext context;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.totalItems.value;

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
            "${DateFormat("dd/MM/yyyy HH:mm").format(item.saleDate!)} WITA",
            style: Theme.of(context).textTheme.bodyMedium
          )
        ),
        DataCell(
          Text(
            item.totalItem.toString(),
            style: Theme.of(context).textTheme.bodyMedium
          )
        ),
        DataCell(
          Text(
            NumberFormat.currency(
              locale: 'id', 
              decimalDigits: 0,
              symbol: "Rp "
            ).format(item.totalPrice),
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyMedium
          )
        ),
        DataCell(
          Text(
            item.userName ?? "-",
            style: Theme.of(context).textTheme.bodyMedium
          )
        ),
        DataCell(
          Container(
            margin: const EdgeInsets.all(8),
            child: Row(
              children: [
                ViewSaleHistoryDetailButton(
                  sale: item,
                  controller: controller
                ),
                const SizedBox(width: 12),
                PrimaryButtonWidget(
                  width: 5.w,
                  customColors: AppColors.pink,
                  margin: const EdgeInsets.all(0),
                  buttonText: "Print", 
                  withIcon: true,
                  icon: const FaIcon(
                    FontAwesomeIcons.print,
                    color: AppColors.white,
                    size: 16,
                  ), 
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ]
    );
  }
}