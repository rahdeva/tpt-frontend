import 'package:flutter/material.dart';
import 'package:tpt_frontend/resources/resources.dart';

class FeaturesDivider extends StatelessWidget {
  const FeaturesDivider({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColors.white.withOpacity(0.2)
            )
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: AppColors.white.withOpacity(0.6),
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Divider(
              color: AppColors.white.withOpacity(0.2)
            )
          ),
        ],
      ),
    );
  }
}