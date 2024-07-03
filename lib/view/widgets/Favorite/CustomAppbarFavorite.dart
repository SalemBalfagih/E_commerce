import 'package:e_commerce/core/colors/color.dart';
import 'package:e_commerce/themes.dart';
import 'package:flutter/material.dart';

class CustomAppbarFavorite extends StatelessWidget {
  const CustomAppbarFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
