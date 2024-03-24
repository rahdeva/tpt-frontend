import 'package:tpt_frontend/feature/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpt_frontend/feature/dashboard/widgets/column_chart_widget.dart';
import 'package:tpt_frontend/feature/dashboard/widgets/pie_chart_widget.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/helper/responsive.dart';
import 'package:sizer/sizer.dart';

class TransactionDashboardPage extends StatelessWidget {
  const TransactionDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionDashboardController>(
      builder: (controller) {
        return SafeArea(
          child: Container(
            width: 100.w,
            margin: const EdgeInsets.fromLTRB(24, 24, 0, 0),
            decoration: const BoxDecoration(
              color: AppColors.background2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!Responsive.isDesktop(context))
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: (){
                        Scaffold.of(context).openDrawer();
                      }
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dashboard",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            const SizedBox(height: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Summary",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: PieChartSample(
                                          length: controller.productByCategory?.length ?? 0,
                                          title: controller.productByCategory?.title ?? "-",
                                          label: controller.productByCategory?.label ?? [],
                                          value: controller.productByCategory?.value ?? [],
                                        )
                                      )
                                    ),
                                    SizedBox(
                                      width: 30.w,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: ColumnChartWidget(
                                          title: controller.topStockProduct?.title ?? "-",
                                          length: controller.topStockProduct?.length ?? 0,
                                          label: controller.topStockProduct?.label ?? [],
                                          value: controller.topStockProduct?.value ?? [],
                                        )
                                      )
                                    ),
                                    SizedBox(
                                      width: 30.w,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: ColumnChartWidget(
                                          title: controller.topExpensiveProduct?.title ?? "-",
                                          length: controller.topExpensiveProduct?.length ?? 0,
                                          label: controller.topExpensiveProduct?.label ?? [],
                                          value: controller.topExpensiveProduct?.value ?? [],
                                        )
                                      )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sale",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 50.w-137,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: ColumnChartWidget(
                                          length: controller.saleTotalTransaction?.length ?? 0,
                                          title: controller.saleTotalTransaction?.title ?? "-",
                                          label: controller.saleTotalTransaction?.label ?? [],
                                          value: controller.saleTotalTransaction?.value ?? [],
                                        )
                                      )
                                    ),
                                    SizedBox(
                                      width: 50.w-137,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: ColumnChartWidget(
                                          title: controller.saleTotalSales?.title ?? "-",
                                          length: controller.saleTotalSales?.length ?? 0,
                                          label: controller.saleTotalSales?.label ?? [],
                                          value: controller.saleTotalSales?.value ?? [],
                                        )
                                      )
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 50.w-137,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: ColumnChartWidget(
                                          length: controller.totalItemSold?.length ?? 0,
                                          title: controller.totalItemSold?.title ?? "-",
                                          label: controller.totalItemSold?.label ?? [],
                                          value: controller.totalItemSold?.value ?? [],
                                        )
                                      )
                                    ),
                                    SizedBox(
                                      width: 50.w-137,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: ColumnChartWidget(
                                          title: controller.totalProfit?.title ?? "-",
                                          length: controller.totalProfit?.length ?? 0,
                                          label: controller.totalProfit?.label ?? [],
                                          value: controller.totalProfit?.value ?? [],
                                        )
                                      )
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                SizedBox(
                                  width: 100.w,
                                  height: 360,
                                  child: Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    color: AppColors.white,
                                    child: ColumnChartWidget(
                                      title: controller.topSaleProduct?.title ?? "-",
                                      length: controller.topSaleProduct?.length ?? 0,
                                      label: controller.topSaleProduct?.label ?? [],
                                      value: controller.topSaleProduct?.value ?? [],
                                    )
                                  )
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Purchase",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 50.w-137,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: ColumnChartWidget(
                                          length: controller.purchaseTotalTransactions?.length ?? 0,
                                          title: controller.purchaseTotalTransactions?.title ?? "-",
                                          label: controller.purchaseTotalTransactions?.label ?? [],
                                          value: controller.purchaseTotalTransactions?.value ?? [],
                                        )
                                      )
                                    ),
                                    SizedBox(
                                      width: 50.w-137,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: ColumnChartWidget(
                                          title: controller.totalPurchase?.title ?? "-",
                                          length: controller.totalPurchase?.length ?? 0,
                                          label: controller.totalPurchase?.label ?? [],
                                          value: controller.totalPurchase?.value ?? [],
                                        )
                                      )
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 50.w-137,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: ColumnChartWidget(
                                          length: controller.totalItemPurchased?.length ?? 0,
                                          title: controller.totalItemPurchased?.title ?? "-",
                                          label: controller.totalItemPurchased?.label ?? [],
                                          value: controller.totalItemPurchased?.value ?? [],
                                        )
                                      )
                                    ),
                                    SizedBox(
                                      width: 50.w-137,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: ColumnChartWidget(
                                          title: controller.topSupplier?.title ?? "-",
                                          length: controller.topSupplier?.length ?? 0,
                                          label: controller.topSupplier?.label ?? [],
                                          value: controller.topSupplier?.value ?? [],
                                        )
                                      )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Financial",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 50.w-137,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: PieChartSample(
                                          length: controller.cashFlow?.length ?? 0,
                                          title: controller.cashFlow?.title ?? "-",
                                          label: controller.cashFlow?.label ?? [],
                                          value: controller.cashFlow?.value ?? [],
                                        )
                                      )
                                    ),
                                    SizedBox(
                                      width: 50.w-137,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: ColumnChartWidget(
                                          title: controller.totalCashByType?.title ?? "-",
                                          length: controller.totalCashByType?.length ?? 0,
                                          label: controller.totalCashByType?.labels ?? [],
                                          value: controller.totalCashByType?.values ?? [],
                                        )
                                      )
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 50.w-137,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: ColumnChartWidget(
                                          length: controller.cashIn?.length ?? 0,
                                          title: controller.cashIn?.title ?? "-",
                                          label: controller.cashIn?.labels ?? [],
                                          value: controller.cashIn?.values ?? [],
                                        )
                                      )
                                    ),
                                    SizedBox(
                                      width: 50.w-137,
                                      height: 360,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),
                                        ),
                                        color: AppColors.white,
                                        child: ColumnChartWidget(
                                          title: controller.cashOut?.title ?? "-",
                                          length: controller.cashOut?.length ?? 0,
                                          label: controller.cashOut?.labels ?? [],
                                          value: controller.cashOut?.values ?? [],
                                        )
                                      )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

