import 'package:e_commerce/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StarRatingWidget extends StatelessWidget {
  final double rating;
  final int reviews;

  const StarRatingWidget({
    Key? key,
    required this.rating,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Star Rating
        Row(
          children: List.generate(
            5,
            (index) => index < rating.round()
                ? Icon(Icons.star, color: Colors.yellow, size: 20)
                : Icon(Icons.star_border, color: Colors.grey, size: 20),
          ),
        ),
        // Reviews Count
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.01),
          child: Text(
            '$reviews reviews',
            style: textTheme1.bodyMedium,
          ),
        ),
      ],
    );
  }
}
