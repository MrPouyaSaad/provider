import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizi_dasht/widgets/loading/dashboard.dart';

class OrdersShimmer extends StatelessWidget {
  const OrdersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        if (index == 0) {
          return AppBar(
            leading: ShimmerCircle(width: 5, height: 5).marginOnly(right: 16),
            actions: [
              ShimmerCircle(width: 40, height: 40).marginOnly(left: 16),
            ],
            title: Text('سفارشات'),
            centerTitle: true,
          );
        }
        return ShimmerBox(width: double.infinity, height: 160)
            .marginOnly(bottom: 16, top: 8, left: 16, right: 16);
      },
    );
  }
}
