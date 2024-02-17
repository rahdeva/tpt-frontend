import 'package:flutter/material.dart';
import 'package:tpt_frontend/feature/history/history_controller.dart';
import 'package:tpt_frontend/feature/history/widgets/history_detail_data_table.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/widget/table/data_column_widget.dart';

class SaleHistoryDetailTableWidget extends StatelessWidget {
  const SaleHistoryDetailTableWidget({
    super.key,
    required this.controller
  });

  final HistoryController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: (controller.isLoading)
        ? const Center(child: CircularProgressIndicator())
        : Scrollbar(
            thumbVisibility: false,
            child: SingleChildScrollView(
              controller: controller.scrollController2,
              child: Container(
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
                  child: PaginatedDataTable(
                    key: controller.tableDetailKey,
                    columnSpacing : 0,
                    rowsPerPage: controller.detailPageSize.value,
                    availableRowsPerPage: const [8, 10, 15],
                    headingRowHeight: 46,
                    onRowsPerPageChanged: (value) {
                      controller.onDetailRowsPerPageChanged(value!);
                    },
                    onPageChanged: (value) {
                      controller.onDetailPageChanged(value);
                    },
                    headingRowColor: MaterialStateProperty.resolveWith(
                      (states) => AppColors.primary
                    ),
                    columns: [
                      dataColumnWidget(
                        context, labelText: "No"
                      ),
                      dataColumnWidget(
                        context, labelText: "Kode Produk"
                      ),
                      dataColumnWidget(
                        context, labelText: "Nama Produk"
                      ),
                      dataColumnWidget(
                        context, labelText: "Harga Jual"
                      ),
                      dataColumnWidget(
                        context, labelText: "Jumlah"
                      ),
                      dataColumnWidget(
                        context, labelText: "SubTotal"
                      ),
                      // dataColumnWidget(
                      //   context, labelText: "Aksi"
                      // ),
                    ],
                    source: SaleReportHistoryDetailDataSource(
                      data: controller.detailDataList,
                      controller: controller,
                      context: context
                    ),
                  ),
                ),
              ),
            ),
        ),
    );
  }
}
