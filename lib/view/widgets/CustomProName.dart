import 'package:e_commerce/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomProName extends StatelessWidget {
  const CustomProName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(seconds: 1),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 50.0, // Adjust the offset as needed
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "E-commerce\n",
                        style: textTheme1.displayLarge,
                      ),
                      TextSpan(
                        text: "Best products at the lowest prices",
                        style: textTheme1.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
