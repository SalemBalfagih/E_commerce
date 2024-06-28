import 'package:e_commerce/Themes.dart';
import 'package:e_commerce/controller/homecontroller.dart';
import 'package:e_commerce/core/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CustomCatogries extends StatelessWidget {
  const CustomCatogries({
    super.key,
    required Homecontroller homecontroller,
  }) : _homecontroller = homecontroller;

  final Homecontroller _homecontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *
          0.05, // Adjusted height for better visibility

      child: GetBuilder<Homecontroller>(
        builder: (controller) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _homecontroller.items.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _homecontroller.selectItem(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _homecontroller.selectedIndex == index
                        ? AppColor.primaryColor
                        : AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width *
                        0.01, // Adjusted margin
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width *
                        0.03, // Added padding for better spacing
                    vertical: MediaQuery.of(context).size.height *
                        0.01, // Added padding for better spacing
                  ),
                  child: Center(
                    child: Text(
                      "${_homecontroller.items[index]}",
                      style: textTheme1.displayLarge!.copyWith(
                        fontSize: 20,
                        color: AppColor.backgroundColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
