import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:tpt_frontend/feature/main/main_controller.dart';
import 'package:tpt_frontend/feature/main/widgets/feature_divider.dart';
import 'package:tpt_frontend/feature/main/widgets/menu_item.dart';
import 'package:tpt_frontend/feature/main/widgets/profile_card.dart';
import 'package:tpt_frontend/resources/resources.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key, 
    required this.controller, 
    required this.userRoles,
  }) : super(key: key);

  final MainController controller;
  final int userRoles;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 40.w,
      elevation: 0,
      surfaceTintColor: AppColors.background2,
      backgroundColor: AppColors.background2,
      child: ListView(
        children: [
          ProfileCard(controller: controller),
          Divider(color: AppColors.white.withOpacity(0.2)),
          userRoles == 1
          ? AdminRoleMenus(controller: controller)
          : userRoles == 2
            ? PemasaranRoleMenus(controller: controller)
            : userRoles == 3
              ? PembelianGudangRoleMenus(controller: controller)
              : userRoles == 4
                ? KeuanganRoleMenus(controller: controller)
                : const SizedBox(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class AdminRoleMenus extends StatelessWidget {
  const AdminRoleMenus({
    super.key,
    required this.controller,
  });

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          controller: controller,
          title: "Home",
          tabIndex: 0,
          icon: const Icon(
            IconlyBold.home,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Setting",
          tabIndex: 1,
          icon: const Icon(
            IconlyBold.setting,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "PointOfSales",
          tabIndex: 2,
          icon: const FaIcon(
            FontAwesomeIcons.cashRegister,
            color: AppColors.white,
          ),
        ),
        const FeaturesDivider(title: "Master Data"),
        MenuItem(
          controller: controller,
          title: "Product",
          tabIndex: 4,
          icon: const FaIcon(
            FontAwesomeIcons.boxesStacked,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Category",
          tabIndex: 5,
          icon: const FaIcon(
            FontAwesomeIcons.box,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Supplier",
          tabIndex: 6,
          icon: const FaIcon(
            FontAwesomeIcons.truck,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "User",
          tabIndex: 7,
          icon: const FaIcon(
            FontAwesomeIcons.users,
            color: AppColors.white,
          ),
        ),
        const FeaturesDivider(title: "Report"),
        MenuItem(
          controller: controller,
          title: "Sale",
          tabIndex: 8,
          icon: const FaIcon(
            FontAwesomeIcons.upload,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Purchase",
          tabIndex: 9,
          icon: const FaIcon(
            FontAwesomeIcons.download,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Financial",
          tabIndex: 10,
          icon: const FaIcon(
            FontAwesomeIcons.coins,
            color: AppColors.white,
          ),
        ),
        // Dashboard
        const FeaturesDivider(title: "Dashboard"),
        MenuItem(
          controller: controller,
          title: "Transaction",
          tabIndex: 11,
          icon: const FaIcon(
            FontAwesomeIcons.cartShopping,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Financial",
          tabIndex: 12,
          icon: const FaIcon(
            FontAwesomeIcons.wallet,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Forecasting",
          tabIndex: 13,
          icon: const Icon(
            IconlyBold.work,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class PemasaranRoleMenus extends StatelessWidget {
  const PemasaranRoleMenus({
    super.key,
    required this.controller,
  });

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          controller: controller,
          title: "Setting",
          tabIndex: 1,
          icon: const Icon(
            IconlyBold.setting,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "PointOfSales",
          tabIndex: 2,
          icon: const FaIcon(
            FontAwesomeIcons.cashRegister,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "History",
          tabIndex: 3,
          icon: const Icon(
            IconlyBold.activity,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class PembelianGudangRoleMenus extends StatelessWidget {
  const PembelianGudangRoleMenus({
    super.key,
    required this.controller,
  });

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          controller: controller,
          title: "Home",
          tabIndex: 0,
          icon: const Icon(
            IconlyBold.home,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Setting",
          tabIndex: 1,
          icon: const Icon(
            IconlyBold.setting,
            color: AppColors.white,
          ),
        ),
        const FeaturesDivider(title: "Master Data"),
        MenuItem(
          controller: controller,
          title: "Product",
          tabIndex: 4,
          icon: const FaIcon(
            FontAwesomeIcons.boxesStacked,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Category",
          tabIndex: 5,
          icon: const FaIcon(
            FontAwesomeIcons.box,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Supplier",
          tabIndex: 6,
          icon: const FaIcon(
            FontAwesomeIcons.truck,
            color: AppColors.white,
          ),
        ),
        const FeaturesDivider(title: "Report"),
        MenuItem(
          controller: controller,
          title: "Sale",
          tabIndex: 8,
          icon: const FaIcon(
            FontAwesomeIcons.upload,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Purchase",
          tabIndex: 9,
          icon: const FaIcon(
            FontAwesomeIcons.download,
            color: AppColors.white,
          ),
        ),
        const FeaturesDivider(title: "Dashboard"),
        MenuItem(
          controller: controller,
          title: "Transaction",
          tabIndex: 11,
          icon: const FaIcon(
            FontAwesomeIcons.cartShopping,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class KeuanganRoleMenus extends StatelessWidget {
  const KeuanganRoleMenus({
    super.key,
    required this.controller,
  });

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          controller: controller,
          title: "Home",
          tabIndex: 0,
          icon: const Icon(
            IconlyBold.home,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Setting",
          tabIndex: 1,
          icon: const Icon(
            IconlyBold.setting,
            color: AppColors.white,
          ),
        ),
        const FeaturesDivider(title: "Report"),
        MenuItem(
          controller: controller,
          title: "Sale",
          tabIndex: 8,
          icon: const FaIcon(
            FontAwesomeIcons.upload,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Purchase",
          tabIndex: 9,
          icon: const FaIcon(
            FontAwesomeIcons.download,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Financial",
          tabIndex: 10,
          icon: const FaIcon(
            FontAwesomeIcons.coins,
            color: AppColors.white,
          ),
        ),
        // Dashboard
        const FeaturesDivider(title: "Dashboard"),
        MenuItem(
          controller: controller,
          title: "Transaction",
          tabIndex: 11,
          icon: const FaIcon(
            FontAwesomeIcons.cartShopping,
            color: AppColors.white,
          ),
        ),
        MenuItem(
          controller: controller,
          title: "Financial",
          tabIndex: 12,
          icon: const FaIcon(
            FontAwesomeIcons.wallet,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}