import 'package:tpt_frontend/feature/report_financial/report_financial_controller.dart';
import 'package:tpt_frontend/feature/report_financial/widgets/add_report_financial.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/widget/button/icon_button.dart';
import 'package:tpt_frontend/utills/widget/forms/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class FinancialReportHeaderWidget extends StatelessWidget {
  const FinancialReportHeaderWidget({
    super.key,
    required this.controller
  });

  final FinancialReportController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Laporan Keuangan",
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w700
          ),
        ),
        const Expanded(child: SizedBox()),
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
                width: 20.w,
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
                  controller.getFinancialReports(
                    keyword: controller.searchKeyword.value
                  );
                }, 
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Container(
          color: AppColors.white.withOpacity(0.2),
          width: 2,
          height: 32,
        ),
        const SizedBox(width: 16),
        Text(
          NumberFormat.currency(
            locale: 'id', 
            decimalDigits: 0,
            symbol: "Rp "
          ).format(controller.balances),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w400
          ),
        ),
        const SizedBox(width: 16),
        Container(
          color: AppColors.white.withOpacity(0.2),
          width: 2,
          height: 32,
        ),
        const SizedBox(width: 16),
        AddFinancialButton(
          controller: controller,
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}