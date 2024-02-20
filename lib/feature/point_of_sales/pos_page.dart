import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpt_frontend/feature/point_of_sales/pos_controller.dart';
import 'package:tpt_frontend/feature/point_of_sales/widgets/cart_total_widget.dart';
import 'package:tpt_frontend/feature/point_of_sales/widgets/header_pos_widget.dart';
import 'package:tpt_frontend/feature/point_of_sales/widgets/product_list_builder.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/helper/responsive.dart';
import 'package:tpt_frontend/utills/widget/state/empty_state_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

class PointOfSalesPage extends StatelessWidget {
  const PointOfSalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PointOfSalesController>(
      builder: (controller) {
        return SafeArea(
          child: Container(
            width: 100.w,
            height: 100.h,
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
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(32, 32, 8, 0),
                              height: 100.h-24,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeaderPOSWidget(
                                    controller: controller
                                  ),
                                  const SizedBox(height: 24),
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        SmartRefresher(
                                          enablePullDown: true,
                                          enablePullUp: controller.hasNext.value,
                                          controller: controller.refreshController,
                                          onRefresh: controller.refreshPage,
                                          onLoading: controller.loadNextPage,
                                          child: (controller.isLoading)
                                          ? const Center(child: CircularProgressIndicator())
                                          : (controller.productDataList.isEmpty)
                                            ? const EmptyStateWidget()
                                            : POSProductBuilder(
                                              controller: controller
                                            ),
                                        ),
                                        ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CartTotalWidget(
                          controller: controller
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