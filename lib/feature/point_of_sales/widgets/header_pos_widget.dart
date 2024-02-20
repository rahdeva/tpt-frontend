import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:tpt_frontend/feature/point_of_sales/pos_controller.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/widget/forms/text_field_widget.dart';

class HeaderPOSWidget extends StatelessWidget {
  const HeaderPOSWidget({
    super.key, 
    required this.controller,
  });

  final PointOfSalesController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Point of Sales",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()),
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 24),
              width: 20.w,
              child: TextFieldWidget(
                name: "Search", 
                hintText: "Search",
                filled: true,
                keyboardType: TextInputType.text,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12, 
                  vertical: 12
                ),
                prefixIcon: const Icon(
                  Icons.search,
                ),
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.colorPrimary
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}