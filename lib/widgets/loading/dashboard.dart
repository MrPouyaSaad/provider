import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DashboardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerCircle(width: 100, height: 100),
                ShimmerCircle(width: 100, height: 100),
                ShimmerCircle(width: 100, height: 100),
              ],
            ),
            SizedBox(height: 32),
            TitleShimmer(),
            SizedBox(height: 10),
            ShimmerBox(width: double.infinity, height: 50, borderRadius: 8),
            SizedBox(height: 10),
            ShimmerBox(width: double.infinity, height: 50, borderRadius: 8),
            SizedBox(height: 32),
            TitleShimmer(),
            SizedBox(height: 10),
            ShimmerBox(width: double.infinity, height: 50, borderRadius: 8),
            SizedBox(height: 10),
            ShimmerBox(width: double.infinity, height: 50, borderRadius: 8),
            SizedBox(height: 32),
            TitleShimmer(),
            SizedBox(height: 10),
            ShimmerBox(width: double.infinity, height: 150, borderRadius: 8),
          ],
        ),
      ),
    );
  }
}

class TitleShimmer extends StatelessWidget {
  const TitleShimmer();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ShimmerBox(width: 100, height: 20, borderRadius: 4), // عنوان سمت راست
        ShimmerBox(width: 100, height: 20, borderRadius: 4), // عنوان سمت راست
      ],
    );
  }
}

class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  const ShimmerBox(
      {required this.width, required this.height, this.borderRadius = 10});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[50]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class ShimmerCircle extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerCircle({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[50]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
