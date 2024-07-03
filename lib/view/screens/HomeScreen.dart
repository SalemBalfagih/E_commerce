import 'package:e_commerce/controller/product_controller.dart';

import 'package:e_commerce/view/widgets/Home/CustomAds.dart';
import 'package:e_commerce/view/widgets/Shared/CustomCatogries.dart';

import 'package:e_commerce/view/widgets/Home/CustomProName.dart';

import 'package:e_commerce/view/widgets/Home/CustomShimmer.dart';
import 'package:e_commerce/view/widgets/Home/customuserimage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

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
              const CustomAds(),
              CustomCatogries(productcontroller: _productcontroller),
              CustomShimmer(productcontroller: _productcontroller),
            ],
          ),
        ),
      ),
    );
  }
}
