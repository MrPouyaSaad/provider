import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizi_dasht/widgets/loading/dashboard.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ShimmerBox(width: double.infinity, height: 48).marginAll(16);
        }
        return ShimmerBox(width: double.infinity, height: 140)
            .marginOnly(bottom: 8, top: 8, left: 16, right: 16);
      },
    );
  }
}
