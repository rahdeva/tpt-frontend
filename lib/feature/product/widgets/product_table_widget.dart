import 'package:get/get.dart';
import 'package:tpt_frontend/feature/product/product_controller.dart';
import 'package:tpt_frontend/feature/product/widgets/product_data_table.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/widget/table/data_column_widget.dart';
import 'package:flutter/material.dart';

class ProductTableWidget extends StatelessWidget {
  const ProductTableWidget({
    super.key,
    required this.controller
  });

  final ProductController controller;

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
                        context, labelText: "Kategori"
                      ),
                      dataColumnWidget(
                        context, labelText: "Nama Produk"
                      ),
                      dataColumnWidget(
                        context, labelText: "Unit"
                      ),
                      dataColumnWidget(
                        context, labelText: "Brand"
                      ),
                      DataColumn(
                        label: InkWell(
                          onTap: (){
                            controller.stockSort.value == false
                            ? controller.getAllProducts(
                                sort: "asc"
                              )
                            : controller.getAllProducts();
                            controller.stockSort.toggle();
                          },
                          child: Row(
                            children: [
                              Text(
                                "Stock",
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: AppColors.white, 
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              controller.stockSort.value == false
                              ? const SizedBox()
                              : const Icon(
                                  Icons.arrow_upward_rounded,
                                  color: AppColors.white,
                                )
                            ],
                          ),
                        ),
                      ),
                      dataColumnWidget(
                        context, labelText: "Aksi"
                      ),
                    ],
                    source: ProductDataSource(
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
