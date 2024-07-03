import 'package:e_commerce/controller/detail_controller.dart';
import 'package:e_commerce/core/colors/color.dart';
import 'package:e_commerce/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCounter extends StatelessWidget {
  final DetailController _detailController;

  const CustomCounter({
    super.key,
    required DetailController detailController,
  }) : _detailController = detailController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
                onPressed: () {
                  _detailController.incrementByOne();
                },
                icon: Icon(
                  Icons.add,
                  size: MediaQuery.of(context).size.height *
                      0.02, // تعديل حجم الأيقونة
                ))),
        Obx(
          () => Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: Text(_detailController.count.toString(),
                style: textTheme1.displayLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColor.secondaryColor)),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            onPressed: () {
              _detailController.decrementByOne();
            },
            icon: Icon(
              Icons.remove,
              size: MediaQuery.of(context).size.height *
                  0.02, // تعديل حجم الأيقونة
            ),
          ),
        ),
      ],
    );
  }
}
