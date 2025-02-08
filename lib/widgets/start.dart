import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SellerRating extends StatelessWidget {
  final double ratingPercentage;

  const SellerRating({super.key, required this.ratingPercentage});

  @override
  Widget build(BuildContext context) {
    final double rating = ratingPercentage * 5;

    return RatingBar.builder(
      initialRating: rating,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 24,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2),
      itemBuilder: (context, _) => const Icon(
        CupertinoIcons.star_fill,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
      ignoreGestures: true,
    );
  }
}
