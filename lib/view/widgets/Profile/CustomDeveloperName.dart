import 'package:e_commerce/core/colors/color.dart';
import 'package:flutter/material.dart';

class CustomDeveloperName extends StatelessWidget {
  const CustomDeveloperName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("SALEM BALFAQIH",
          style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
