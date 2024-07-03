import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/view/widgets/Shared/CustomCatogries.dart';
import 'package:e_commerce/view/widgets/Shared/CustomProducts.dart';
import 'package:e_commerce/view/widgets/Search/CustomSearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  final productcontroller = Get.put(ProductController());

  SearchPage({super.key});
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
            const CustomSearch(),
            CustomCatogries(productcontroller: productcontroller),
            Expanded(
                child: CustomProducts(productcontroller: productcontroller))
          ],
        ),
      )),
    );
  }
}
