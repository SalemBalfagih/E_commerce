import 'package:e_commerce/core/colors/color.dart';
import 'package:e_commerce/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomAds extends StatelessWidget {
  const CustomAds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(seconds: 1),
      child: SlideAnimation(
        horizontalOffset: 300.0,
        child: FadeInAnimation(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 241, 187, 17),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "DISCOUNT FOR ALL PRODUCTS\nUP TO",
                                  style: textTheme1.displayLarge!.copyWith(
                                    color: AppColor.secondaryColor,
                                  ),
                                ),
                                TextSpan(
                                  text: " 50%",
                                  style: textTheme1.displayLarge!.copyWith(
                                    color: AppColor.accentColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Image.asset(
                    "lib/images/photo_2024-06-30_13-23-28.jpg",
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.height * 1,
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
