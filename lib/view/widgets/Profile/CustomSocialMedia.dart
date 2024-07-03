import 'package:e_commerce/core/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomSocialMedia extends StatelessWidget {
  final int seconds;
  final void Function()? onTap;
  final String assetName;
  const CustomSocialMedia({
    super.key,
    required this.seconds,
    required this.assetName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: Duration(seconds: seconds),
      child: SlideAnimation(
        verticalOffset: -50,
        child: FadeInAnimation(
          child: InkWell(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.02,
              ),
              child: CircleAvatar(
                backgroundColor: AppColor.primaryColor,
                radius: 25,
                child: CircleAvatar(
                  backgroundColor: AppColor.secondaryColor,
                  radius: 23,
                  backgroundImage: AssetImage(assetName),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
