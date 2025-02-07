import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SellerRating extends StatelessWidget {
  final double ratingPercentage; // درصد دریافتی از سرور (مثلاً 0.8 برای 80%)

  const SellerRating({super.key, required this.ratingPercentage});

  @override
  Widget build(BuildContext context) {
    // تبدیل درصد به ریتینگ ۵ ستاره (مثلاً 80% -> 4 ستاره)
    final double rating = ratingPercentage * 5;

    return RatingBar.builder(
      initialRating: rating,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true, // اجازه می‌دهد نیم ستاره هم نمایش داده شود
      itemCount: 5, // تعداد ستاره‌ها
      itemSize: 24, // اندازه ستاره‌ها
      itemPadding: const EdgeInsets.symmetric(horizontal: 2),
      itemBuilder: (context, _) => const Icon(
        CupertinoIcons.star_fill,
        color: Colors.amber, // رنگ ستاره‌ها
      ),
      onRatingUpdate: (rating) {
        // اینجا نیازی به انجام کاری نیست، چون فقط نمایشی است
      },
      ignoreGestures: true, // غیرفعال کردن تعامل کاربر
    );
  }
}
