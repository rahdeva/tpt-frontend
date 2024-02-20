import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';
import 'package:tpt_frontend/feature/point_of_sales/pos_controller.dart';
import 'package:tpt_frontend/feature/point_of_sales/widgets/order_table_widget.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:tpt_frontend/utills/helper/currency_text_input_formatter.dart';
import 'package:tpt_frontend/utills/helper/string_formatter.dart';
import 'package:tpt_frontend/utills/helper/validator.dart';
import 'package:tpt_frontend/utills/widget/button/primary_button.dart';
import 'package:tpt_frontend/utills/widget/forms/label_form_widget.dart';
import 'package:tpt_frontend/utills/widget/forms/text_field_widget.dart';
import 'package:tpt_frontend/utills/widget/pop_up/pop_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ViewOrderDetailButton extends StatelessWidget {
  const ViewOrderDetailButton({
    super.key,
    // required this.cartProduct,
    required this.controller,
  });

  // final CartProduct cartProduct;
  final PointOfSalesController controller;

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      margin: const EdgeInsets.all(0),
      buttonText: "Proceed",
      onPressed: () async {
        await controller.addCartDataRow();
        // ignore: use_build_context_synchronously
        PopUpWidget.inputPopUp(
          context: context,
          width: 72.w,
          titleString: "Detail Transaksi", 
          withMiddleText: false,
          content: SizedBox(
            height: 72.h,
            width: 72.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children : [  
                const SizedBox(height: 16),
                OrderTableWidget(
                  controller: controller
                ),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Text(
                //     "Total : ${NumberFormat.currency(
                //       locale: 'id', 
                //       decimalDigits: 0,
                //       symbol: "Rp "
                //     ).format(purchase.totalPrice)}",
                //     textAlign: TextAlign.center, 
                //     style: const TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.w700,
                //       color: AppColors.black,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primary
                        ),
                        child: Center(
                          child: Text(
                            "Total : ${NumberFormat.currency(
                              locale: 'id', 
                              decimalDigits: 0,
                              symbol: "Rp "
                            ).format(controller.total.value)}",
                            textAlign: TextAlign.center, 
                            style: const TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 32),
                    FormBuilder(
                      key: controller.orderFormKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const LabelFormWidget2(
                                label: "Total"
                              ),
                              SizedBox(
                                width: 20.w - 16,
                                height: 32,
                                child: TextFieldWidget(
                                  enabled: false,
                                  name: 'total',
                                  hintText: "",
                                  initialValue: NumberFormat.currency(
                                    locale: 'id',
                                    decimalDigits: 0,
                                    symbol: "Rp "
                                  ).format(controller.total.value),
                                  validator: Validator.required(),
                                  keyboardType: TextInputType.number,
                                  borderRadius: 10,
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    CurrencyTextInputFormatter(
                                      locale: 'id',
                                      decimalDigits: 0,
                                      symbol: 'Rp ',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const LabelFormWidget2(
                                label: "Diterima"
                              ),
                              SizedBox(
                                width: 20.w - 16,
                                height: 32,
                                child: TextFieldWidget(
                                  name: 'money_received',
                                  hintText: "",
                                  validator: Validator.required(),
                                  keyboardType: TextInputType.number,
                                  borderRadius: 10,
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                  onChanged: (value) {
                                    int moneyChange = 
                                      StringFormatter.formatCurrencyNumber(
                                        controller.orderFormKey.currentState!.fields['money_received']!.value
                                      ) - controller.total.value;
                                    controller.orderFormKey.currentState!.patchValue({
                                      'money_change' : NumberFormat.currency(
                                        locale: 'id',
                                        decimalDigits: 0,
                                        symbol: "Rp "
                                      ).format(moneyChange),
                                    });
                                  },
                                  inputFormatters: <TextInputFormatter>[
                                    CurrencyTextInputFormatter(
                                      locale: 'id',
                                      decimalDigits: 0,
                                      symbol: 'Rp ',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const LabelFormWidget2(
                                label: "Kembalian"
                              ),
                              SizedBox(
                                width: 20.w - 16,
                                height: 32,
                                child: TextFieldWidget(
                                  enabled: false,
                                  name: 'money_change',
                                  hintText: "",
                                  validator: Validator.required(),
                                  keyboardType: TextInputType.number,
                                  borderRadius: 10,
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    CurrencyTextInputFormatter(
                                      locale: 'id',
                                      decimalDigits: 0,
                                      symbol: 'Rp ',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 32),
                Container(
                  margin: const EdgeInsets.only(right: 0),
                  alignment: Alignment.centerRight,
                  child: PrimaryButtonWidget(
                    customColors: AppColors.primary,
                    margin: const EdgeInsets.all(0),
                    buttonText: "Verifikasi Pembayaran", 
                    withIcon: true,
                    icon: const Icon(
                      IconlyLight.send,
                      color: AppColors.white,
                      size: 16,
                    ), 
                    onPressed: () {
                      if(
                        controller.orderFormKey.currentState != null &&
                        controller.orderFormKey.currentState!.saveAndValidate()
                      ){
                        String moneyChange = controller.orderFormKey.currentState!.fields['money_change']!.value;
                        if(StringFormatter.formatCurrencyNumberWithNegative(moneyChange) >= 0){
                          controller.addNewSale(
                            saleDate: DateTime.now(),
                            context: context
                          );
                        }
                      }
                    }
                  ),
                )
              ],
            ),
          )
        );
      },
    );
  }
}
