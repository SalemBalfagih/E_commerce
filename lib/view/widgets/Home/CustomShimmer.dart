import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/view/widgets/Shared/CustomProducts.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    required ProductController productcontroller,
  }) : _productcontroller = productcontroller;

  final ProductController _productcontroller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        if (_productcontroller.isLoading.value) {
          return GridView.builder(
            //*
            itemCount: 8, // Placeholder item count for shimmer effect
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ));
            },
          );
        } else {
          // Display products

          return CustomProducts(productcontroller: _productcontroller);
        }
      }),
    );
  }
}
