import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/core/colors/color.dart';
import 'package:e_commerce/route.dart';
import 'package:e_commerce/themes.dart';
import 'package:e_commerce/view/widgets/CustomCatogries.dart';
import 'package:e_commerce/view/widgets/CustomNavBar.dart';
import 'package:e_commerce/view/widgets/CustomProName.dart';
import 'package:e_commerce/view/widgets/CustomProducts.dart';
import 'package:e_commerce/view/widgets/CustomSearch.dart';
import 'package:e_commerce/view/widgets/CustomShimmer.dart';
import 'package:e_commerce/view/widgets/customuserimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);

  final ProductController _productcontroller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * 0.03,
            right: MediaQuery.sizeOf(context).width * 0.03,
            top: MediaQuery.sizeOf(context).height * 0.02,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomUserImage(),
              const CustomProName(),
              AnimationConfiguration.staggeredList(
                position: 0,
                duration: const Duration(seconds: 1),
                child: SlideAnimation(
                  horizontalOffset: 300.0,
                  child: FadeInAnimation(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 241, 187, 17),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.03,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.01),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "DISCOUNT FOR ALL PRODUCTS\nUP TO",
                                            style: textTheme1.displayLarge!
                                                .copyWith(
                                              color: AppColor.secondaryColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text: " 50%",
                                            style: textTheme1.displayLarge!
                                                .copyWith(
                                              color: AppColor.accentColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Image.asset(
                              "lib/images/photo_2024-06-30_13-23-28.jpg",
                              fit: BoxFit.contain,
                              height: MediaQuery.of(context).size.height * 1,
                              width: MediaQuery.of(context).size.height * 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              CustomCatogries(productcontroller: _productcontroller),
              CustomShimmer(productcontroller: _productcontroller),
            ],
          ),
        ),
      ),
    );
  }
}
