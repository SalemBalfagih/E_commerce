import 'package:e_commerce/view/widgets/Favorite/CustomAppbarFavorite.dart';
import 'package:e_commerce/view/widgets/Favorite/CustomFavoriteProdact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/view/screens/ProductDetailPage.dart';

class FavoriteProducts extends StatelessWidget {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const CustomAppbarFavorite(),
      ),
      body: Obx(() {
        if (productController.favoriteProducts.isEmpty) {
          return const Center(
            child: Text("No favorites added yet."),
          );
        } else {
          return GridView.builder(
            itemCount: productController.favoriteProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              var product = productController.favoriteProducts[index];
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(seconds: 1),
                columnCount: 2,
                child: ScaleAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => ProductDetailPage(product: product));
                      },
                      child: CustomFavoriteProdact(product: product),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
