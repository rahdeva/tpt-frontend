import 'package:tpt_frontend/feature/supplier/supplier_controller.dart';
import 'package:tpt_frontend/feature/supplier/widgets/supplier_header_widget.dart';
import 'package:tpt_frontend/feature/supplier/widgets/supplier_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/helper/responsive.dart';
import 'package:sizer/sizer.dart';

class SupplierPage extends StatelessWidget {
  const SupplierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupplierController>(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                        height: 100.h-24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SupplierHeaderWidget(controller: controller),
                            const SizedBox(height: 8),
                            Container(
                              margin: const EdgeInsets.only(right: 24),
                              child: const Divider(color: AppColors.white,)
                            ),
                            const SizedBox(height: 8),
                            SupplierTableWidget(controller: controller),
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
