import 'package:e_commerce/controller/homecontroller.dart';
import 'package:e_commerce/core/colors/color.dart';
import 'package:e_commerce/view/widgets/CustomCatogries.dart';
import 'package:e_commerce/view/widgets/CustomNavBar.dart';
import 'package:e_commerce/view/widgets/CustomProName.dart';
import 'package:e_commerce/view/widgets/CustomSearch.dart';
import 'package:e_commerce/view/widgets/customuserimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Themes.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  final Homecontroller _homecontroller = Get.put(Homecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(homecontroller: _homecontroller),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomUserImage(),
              const CustomProName(),
              const CustomSearch(),
              CustomCatogries(homecontroller: _homecontroller),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: GridView.builder(
                    itemCount: 8,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).width * 0.02,
                            vertical: MediaQuery.sizeOf(context).height * 0.01),
                        margin: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).width * 0.02,
                            vertical: MediaQuery.sizeOf(context).height * 0.01),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColor.secondaryColor,
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColor.secondaryColor,
                                  blurRadius: 5.5,
                                  spreadRadius: 0.5)
                            ],
                            image: const DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80"),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "data",
                                  style: TextStyle(
                                      fontFamily: "BebasNeue",
                                      fontSize: 20,
                                      color: AppColor.backgroundColor),
                                ),
                                Icon(Icons.favorite_outline,
                                    color: AppColor.backgroundColor, size: 25),
                              ],
                            ),
                            Text(
                              "data",
                              style: TextStyle(
                                  fontFamily: "BebasNeue",
                                  fontSize: 20,
                                  color: AppColor.primaryColor),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
