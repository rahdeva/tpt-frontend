import 'package:flutter/material.dart';
import 'package:tpt_frontend/feature/main/main_controller.dart';
import 'package:tpt_frontend/resources/resources.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.controller,
    required this.title,
    required this.icon,
    required this.tabIndex,
  });

  final MainController controller;
  final String title;
  final Widget icon;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 12, 10, 8),
      decoration: BoxDecoration(
        color: controller.tabIndex == tabIndex
          ? AppColors.primary
          : Colors.transparent,
        borderRadius: BorderRadius.circular(8)
      ),
      child: DrawerListTile(
        title: title,
        icon: SizedBox(
          height: 32,
          width: 32,
          child: Center(
            child: icon
          ),
        ),
        press: () {
          controller.changeTabIndex(tabIndex);
        },
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final Widget icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: icon,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 13,
          color: AppColors.white,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
