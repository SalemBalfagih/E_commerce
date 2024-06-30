import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCatogries extends StatelessWidget {
  final ProductController productcontroller;

  const CustomCatogries({required this.productcontroller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: productcontroller.categories.map((category) {
            return GestureDetector(
              onTap: () {
                productcontroller.filterProducts(category);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                    vertical: MediaQuery.of(context).size.height * 0.01),
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02,
                    vertical: MediaQuery.of(context).size.height * 0.01),
                decoration: BoxDecoration(
                  color: productcontroller.selectedCategory.value == category
                      ? Colors.black
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 300),
                    child: Text(category),
                    style: textTheme1.bodyMedium!.copyWith(
                        color:
                            productcontroller.selectedCategory.value == category
                                ? Colors.white
                                : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
