import 'package:flutter/material.dart';
import 'package:tpt_frontend/feature/history/history_controller.dart';
import 'package:tpt_frontend/feature/history/widgets/history_data_table.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/widget/table/data_column_widget.dart';

class SaleHistoryTableWidget extends StatelessWidget {
  const SaleHistoryTableWidget({
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
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.only(right: 24),
                width: double.infinity,
                child: Theme(
                  data: ThemeData(
                    cardTheme: Theme.of(context).cardTheme,
                    textTheme: Theme.of(context).textTheme.copyWith(
                      bodySmall: Theme.of(context).textTheme.titleSmall,
                    )
                  ),
                  child: PaginatedDataTable(
                    key: controller.tableKey,
                    columnSpacing : 0,
                    rowsPerPage: controller.pageSize.value,
                    availableRowsPerPage: const [10, 25, 50],
                    headingRowHeight: 46,
                    onRowsPerPageChanged: (value) {
                      controller.onRowsPerPageChanged(value!);
                    },
                    onPageChanged: (value) {
                      controller.onPageChanged(value);
                    },
                    headingRowColor: MaterialStateProperty.resolveWith(
                      (states) => AppColors.primary
                    ),
                    columns: [
                      dataColumnWidget(
                        context, labelText: "No"
                      ),
                      dataColumnWidget(
                        context, labelText: "Tanggal"
                      ),
                      dataColumnWidget(
                        context, labelText: "Total Item"
                      ),
                      dataColumnWidget(
                        context, labelText: "Total Price"
                      ),
                      dataColumnWidget(
                        context, labelText: "User"
                      ),
                      dataColumnWidget(
                        context, labelText: "Aksi"
                      ),
                    ],
                    source: SalesHistoryDataSource(
                      data: controller.dataList,
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
