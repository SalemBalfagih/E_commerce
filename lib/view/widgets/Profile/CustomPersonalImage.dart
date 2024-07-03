import 'package:e_commerce/core/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomPersonalImage extends StatelessWidget {
  const CustomPersonalImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          "lib/images/1719915358350.jpeg",
          width: MediaQuery.sizeOf(context).width,
          fit: BoxFit.fill,
          height: MediaQuery.sizeOf(context).height * 0.3,
        ),
        const Divider(
          color: AppColor.primaryColor,
          thickness: 3,
          height: 5,
        ),
        const Positioned(
          bottom: -50,
          child: AnimationConfiguration.staggeredList(
            position: 0,
            duration: Duration(seconds: 3),
            child: SlideAnimation(
              verticalOffset: 350.0,
              child: FadeInAnimation(
                child: CircleAvatar(
                  backgroundColor: AppColor.primaryColor,
                  radius: 60,
                  child: CircleAvatar(
                    backgroundColor: AppColor.secondaryColor,
                    radius: 57,
                    backgroundImage: AssetImage("lib/images/1719915386200.jpg"),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
