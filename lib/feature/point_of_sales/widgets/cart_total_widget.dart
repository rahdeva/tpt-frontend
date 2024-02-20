import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:tpt_frontend/feature/point_of_sales/pos_controller.dart';
import 'package:tpt_frontend/feature/point_of_sales/widgets/cart_list_builder.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/widget/button/primary_button.dart';

class CartTotalWidget extends StatelessWidget {
  const CartTotalWidget({
    super.key, 
    required this.controller,
  });

  final PointOfSalesController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h-24,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 1,
            color: AppColors.white.withOpacity(0.5)
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(32, 32, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      IconButton(
                        onPressed: (){}, 
                        icon: const FaIcon(
                          FontAwesomeIcons.trash,
                          size: 16,
                          color: AppColors.red,
                        )
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: CartListBuilder(
                      controller: controller
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2,
            child: Divider(
              color: AppColors.white.withOpacity(0.5),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 24),
                PrimaryButtonWidget(
                  margin:  const EdgeInsets.all(0),
                  buttonText: "Proceed", 
                  onPressed: () async {
                    
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}