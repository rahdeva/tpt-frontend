import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpt_frontend/feature/main/widgets/side_menu.dart';
import 'package:tpt_frontend/utills/helper/responsive.dart';

import 'main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          drawer: SideMenu(
            controller: controller, 
            userRoles: controller.userRoles
          ),
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context))
                  Expanded(
                    child: GetBuilder(
                      id: 'side-menu',
                      init: controller,
                      builder: (_) {
                        return SideMenu(
                          controller: controller,
                          userRoles: controller.userRoles,
                        );
                      }
                    ),
                  ),
                Expanded(
                  flex: 7,
                  child: GetBuilder(
                    id: 'content',
                    init: controller,
                    builder: (_) {
                      return controller.pageView[controller.tabIndex];
                    }
                  ),
                ),
              ],
            ),
          )
        );
      },
    );
  }
}