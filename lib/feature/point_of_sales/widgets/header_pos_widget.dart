import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:tpt_frontend/feature/point_of_sales/pos_controller.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/widget/button/icon_button.dart';
import 'package:tpt_frontend/utills/widget/forms/text_field_widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
            Row(
              children: [
                IconButtonWidget(
                  controller: controller,
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowsRotate,
                    color: AppColors.white,
                    size: 16,
                  ),
                  onPressed: (){
                    controller.refreshPage();
                  }, 
                ),
                const SizedBox(width: 16),
                Container(
                  color: AppColors.white.withOpacity(0.2),
                  width: 2,
                  height: 32,
                ),
                const SizedBox(width: 16),
                FormBuilder(
                  key: controller.searchformKey,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                        height: 32,
                        child: TextFieldWidget(
                          name: "search", 
                          hintText: "Search",
                          filled: true,
                          keyboardType: TextInputType.text,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, 
                            vertical: 2
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.colorPrimary
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButtonWidget(
                        controller: controller,
                        icon: const Icon(
                          IconlyLight.send,
                          color: AppColors.white,
                          size: 16,
                        ),
                        onPressed: (){
                          controller.searchKeyword.value = controller.searchformKey.currentState!.fields['search']!.value;
                          controller.getAllProduct(
                            keyword: controller.searchKeyword.value
                          );
                        }, 
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}