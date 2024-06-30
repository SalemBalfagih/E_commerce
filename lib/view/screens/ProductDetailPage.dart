import 'package:e_commerce/core/colors/color.dart';
import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.5,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: AppColor.primaryColor,
                    spreadRadius: 3,
                    blurRadius: 3,
                  ),
                ],
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                ),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.02,
                    vertical: MediaQuery.sizeOf(context).height * 0.01),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          Icon(
                            Icons.favorite_border_outlined,
                            color: AppColor.backgroundColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      child: Image.network(
                        product.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              )
              //    Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Center(
              //         child: FadeInImage.assetNetwork(
              //           placeholder: 'assets/loading.gif',
              //           image: product.image,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //       SizedBox(height: 16),
              //       Text(
              //         product.title,
              //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              //       ),
              //       SizedBox(height: 8),
              //       Text(
              //         "\$${product.price}",
              //         style: TextStyle(fontSize: 20, color: Colors.green),
              //       ),
              //       SizedBox(height: 16),
              //       Text(
              //         product.description,
              //         style: TextStyle(fontSize: 16),
              //       ),
              //     ],
              //   ),
              ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * 0.01,
                vertical: MediaQuery.sizeOf(context).height * 0.02),
            child: Center(
              child: Text(
                product.title,
                maxLines: 2,
                style: textTheme1.displayLarge,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).height * 0.01,
            ),
            child: Center(
              child: Text(
                product.description,
                style: textTheme1.bodyMedium,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
