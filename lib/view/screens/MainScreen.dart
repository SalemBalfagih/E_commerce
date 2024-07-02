import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/route.dart';
import 'package:e_commerce/view/widgets/CustomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => pages[productController.currentIndex.value]),
        bottomNavigationBar:
            CustomNavBar(productcontroller: productController));
  }
}
