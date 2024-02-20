import 'package:flutter/material.dart';
import '/resources/resources.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    super.key, 
    this.title, 
    this.textColor, 
    this.imageWidth,
  });

  final double? imageWidth;
  final String? title;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
        heightFactor: 1,
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image(
                width: imageWidth ?? 180,
                fit: BoxFit.fill,
                image:  AppImages.imgEmpty.image().image,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(24, 24, 24, 20),
                child: Text(
                  title ?? "Data not found",
                  style:  Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.normal,
                    color: textColor ?? AppColors.black
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
  }
}