import 'package:e_commerce/core/colors/color.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';

class CustomFavoriteProdact extends StatelessWidget {
  const CustomFavoriteProdact({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: AppColor.backgroundColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.favorite,
                color: AppColor.accentColor,
                size: MediaQuery.of(context).size.width * 0.06,
              ),
            ],
          ),
          Flexible(
            child: Image.network(
              product.image,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.height * 0.40,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: AppColor.backgroundColor);
              },
            ),
          ),
          Flexible(
            child: Text(
              product.title,
              style: TextStyle(
                fontFamily: "Caveat",
                fontSize: MediaQuery.of(context).size.width * 0.04,
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
    );
  }
}
