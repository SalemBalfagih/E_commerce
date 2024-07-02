import 'package:e_commerce/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/view/screens/ProductDetailPage.dart';
import 'package:e_commerce/core/colors/color.dart';

class FavoriteProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'Favorite Products',
                style: textTheme1.displayLarge,
              ),
            ),
            Flexible(
              child: IconButton(
                icon: Icon(Icons.favorite, color: AppColor.accentColor),
                onPressed: () {
                  // Implement refresh logic if needed
                },
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (productController.favoriteProducts.isEmpty) {
          return Center(
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
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02,
                          vertical: MediaQuery.of(context).size.height * 0.01,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02,
                          vertical: MediaQuery.of(context).size.height * 0.01,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColor.secondaryColor,
                          boxShadow: const [
                            BoxShadow(
                              color: AppColor.secondaryColor,
                              blurRadius: 5.5,
                              spreadRadius: 0.5,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "\$${product.price}",
                                    style: TextStyle(
                                      fontFamily: "BebasNeue",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: AppColor.backgroundColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: AppColor.accentColor,
                                  size:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                              ],
                            ),
                            Flexible(
                              child: Image.network(
                                product.image,
                                fit: BoxFit.contain,
                                height:
                                    MediaQuery.of(context).size.height * 0.40,
                                width:
                                    MediaQuery.of(context).size.height * 0.40,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.error,
                                      color: AppColor.backgroundColor);
                                },
                              ),
                            ),
                            Flexible(
                              child: Text(
                                product.title,
                                style: TextStyle(
                                  fontFamily: "Caveat",
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.backgroundColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
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
