import 'package:e_commerce/Themes.dart';
import 'package:e_commerce/core/colors/color.dart';

import 'package:e_commerce/view/screens/MainScreen.dart';
import 'package:e_commerce/view/screens/ProductDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
        textTheme: textTheme1,
        useMaterial3: true,
      ),
      home: MainPage(),
      getPages: [
        GetPage(
            name: '/product_detail',
            page: () => ProductDetailPage(product: Get.arguments)),
      ],
    );
  }
}
