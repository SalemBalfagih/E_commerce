import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/core/colors/color.dart';
import 'package:e_commerce/view/widgets/CustomCatogries.dart';
import 'package:e_commerce/view/widgets/CustomNavBar.dart';
import 'package:e_commerce/view/widgets/CustomProName.dart';
import 'package:e_commerce/view/widgets/CustomProducts.dart';
import 'package:e_commerce/view/widgets/CustomSearch.dart';
import 'package:e_commerce/view/widgets/customuserimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Themes.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final ProductController _productcontroller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(productcontroller: _productcontroller),
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
              CustomCatogries(productcontroller: _productcontroller),
              CustomProducts(productcontroller: _productcontroller)
            ],
          ),
        ),
      ),
    );
  }
}
