import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/core/colors/color.dart';
import 'package:e_commerce/view/screens/ProductDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomProducts extends StatelessWidget {
  const CustomProducts({
    super.key,
    required ProductController productcontroller,
  }) : _productcontroller = productcontroller;

  final ProductController _productcontroller;

  @override
  Widget build(BuildContext context) {
    return GetX<ProductController>(builder: (controller) {
      int itemCount = _productcontroller.productList.length;
      return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
        child: Expanded(
          child: AnimationLimiter(
            child: GridView.builder(
              itemCount: itemCount,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                if (index >= itemCount) return SizedBox(); // Avoid RangeError
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  columnCount: 2,
                  duration: const Duration(seconds: 1),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: ScaleAnimation(
                      scale: 0.5,
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ProductDetailPage(
                                  product:
                                      _productcontroller.productList[index],
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.02,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01,
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.02,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01,
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
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "\$${_productcontroller.productList[index].price}",
                                        style: TextStyle(
                                          fontFamily: "BebasNeue",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          color: AppColor.accentColor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.toggleFavorite();
                                      },
                                      child: GetBuilder<ProductController>(
                                        init: ProductController(),
                                        builder: (controller1) {
                                          return Icon(
                                            controller1.isFavorite.value
                                                ? Icons.favorite_border
                                                : Icons.favorite,
                                            color: AppColor.accentColor,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: Image.network(
                                    _productcontroller.productList[index].image,
                                    fit: BoxFit.contain,
                                    height: MediaQuery.of(context).size.height *
                                        0.40,
                                    width: MediaQuery.of(context).size.height *
                                        0.40,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(Icons.error,
                                          color: AppColor.backgroundColor);
                                    },
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    _productcontroller.productList[index].title,
                                    style: TextStyle(
                                      fontFamily: "Caveat",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
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
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
