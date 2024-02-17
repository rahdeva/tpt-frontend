import 'package:flutter/material.dart';
import 'package:tpt_frontend/resources/resources.dart';

DataColumn dataColumnWidget(
  BuildContext context,
  {String labelText = "-"}
) {
  return DataColumn(
    label: Text(
      labelText,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: AppColors.white, 
        fontWeight: FontWeight.w700
      ),
    ),
  );
}
