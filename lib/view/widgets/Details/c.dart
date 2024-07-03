import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';

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
      duration: const Duration(milliseconds: 300),
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
