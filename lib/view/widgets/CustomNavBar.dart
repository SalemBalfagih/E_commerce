import 'package:e_commerce/controller/homecontroller.dart';
import 'package:e_commerce/core/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required Homecontroller homecontroller,
  }) : _homecontroller = homecontroller;

  final Homecontroller _homecontroller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => WaterDropNavBar(
          bottomPadding: MediaQuery.sizeOf(context).height * 0.02,
          backgroundColor: const Color.fromARGB(255, 72, 71, 71),
          waterDropColor: AppColor.primaryColor,
          barItems: [
            BarItem(
              filledIcon: Icons.home,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
                filledIcon: Icons.shopping_bag,
                outlinedIcon: Icons.shopping_bag_outlined),
            BarItem(
                filledIcon: Icons.notifications,
                outlinedIcon: Icons.notifications_none_outlined),
            BarItem(
                filledIcon: Icons.person,
                outlinedIcon: Icons.person_2_outlined),
          ],
          selectedIndex: _homecontroller.selectedIndexbar.value,
          onItemSelected: (index) {
            _homecontroller.onItemSelectedbar(index);
          },
        ));
  }
}
