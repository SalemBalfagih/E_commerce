import 'package:e_commerce/core/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbarDetail extends StatelessWidget {
  const CustomAppbarDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back,
              color: AppColor.backgroundColor, size: 30),
          onPressed: () {
            Get.back();
          },
        ),
        const Icon(
          Icons.shopping_cart_outlined,
          color: AppColor.backgroundColor,
          size: 30,
        ),
      ],
    );
  }
}
