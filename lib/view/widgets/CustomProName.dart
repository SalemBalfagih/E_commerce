import 'package:e_commerce/themes.dart';
import 'package:flutter/material.dart';

class CustomProName extends StatelessWidget {
  const CustomProName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: "E-commerce\n",
        style: textTheme1.displayLarge,
      ),
      TextSpan(
        text: "Best products at the lowest prices",
        style: textTheme1.bodyMedium,
      )
    ]));
  }
}
