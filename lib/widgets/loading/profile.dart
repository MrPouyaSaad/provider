import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizi_dasht/widgets/dvider.dart';
import 'package:vizi_dasht/widgets/loading/dashboard.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ShimmerBox(width: double.infinity, height: 84)
              .marginOnly(top: 16, left: 16, right: 16);
        }
        if (index == 1) {
          return Column(
            children: [
              MyDivider(color: Colors.grey[300])
                  .marginSymmetric(horizontal: 16),
              ShimmerBox(width: double.infinity, height: 68)
                  .marginSymmetric(horizontal: 16),
              MyDivider(color: Colors.grey[300])
                  .marginSymmetric(horizontal: 16),
            ],
          );
        }
        return ShimmerBox(width: double.infinity, height: 52)
            .marginSymmetric(horizontal: 16, vertical: 4);
      },
    );
  }
}
