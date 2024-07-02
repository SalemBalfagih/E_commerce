import 'package:e_commerce/controller/detail_controller.dart';
import 'package:e_commerce/core/colors/color.dart';
import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/themes.dart';
import 'package:e_commerce/view/widgets/CustomCounter.dart';
import 'package:e_commerce/view/widgets/CustomStarRatin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product, Key? key}) : super(key: key);
  final _detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.46,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: screenHeight * 0.01,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight * 0.06,
                        child: CustomAppbarDetail(),
                      ),
                      Hero(
                        tag: 'productImage_${product.id}',
                        child: CustomProductImage(product: product),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: screenHeight * 0.01,
                      ),
                      child: Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme1.displayLarge!.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${product.price}",
                              style: textTheme1.displayLarge!.copyWith(
                                color: AppColor.secondaryColor,
                              ),
                            ),
                            CustomCounter(
                              detailController: _detailController,
                            ),
                          ],
                        ),
                        StarRatingWidget(
                          rating: 4,
                          reviews: 250,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text(
                      "Description",
                      style: textTheme1.displayLarge!.copyWith(fontSize: 20),
                    ),
                    Container(
                      height: screenHeight * 0.20,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                        vertical: screenHeight * 0.01,
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        children: [
                          Center(
                            child: Text(
                              product.description,
                              style: textTheme1.bodyMedium!.copyWith(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    MaterialButton(
                      color: AppColor.primaryColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.1,
                        vertical: screenHeight * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minWidth: double.infinity,
                      height: screenHeight * 0.06,
                      onPressed: () {},
                      child: Text(
                        "Add to cart",
                        style: textTheme1.displayLarge!.copyWith(
                          color: AppColor.secondaryColor,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          icon:
              Icon(Icons.arrow_back, color: AppColor.backgroundColor, size: 30),
          onPressed: () {
            Get.back();
          },
        ),
        Icon(
          Icons.shopping_cart_outlined,
          color: AppColor.backgroundColor,
          size: 30,
        ),
      ],
    );
  }
}

class CustomProductImage extends StatelessWidget {
  const CustomProductImage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 300),
      builder: (context, double value, child) {
        return Transform.rotate(
          angle: value * 6.28, // 360 degrees in radians
          child: Image.network(
            product.image,
            fit: BoxFit.contain,
            height: screenHeight * 0.35,
          ),
        );
      },
    );
  }
}
