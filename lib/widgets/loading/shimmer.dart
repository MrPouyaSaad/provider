import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vizi_dasht/common/const.dart';

final _baseColor = Colors.grey[300]!;
final _highlightColor = Colors.grey[100]!;

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: _baseColor,
            highlightColor: _highlightColor,
            child: Container(
              height: 20,
              width: 200,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Shimmer.fromColors(
            baseColor: _baseColor,
            highlightColor: _highlightColor,
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: Constants.primaryRadius,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => buildShimmerItem(),
          ),
        ],
      ),
    );
  }

  Widget buildShimmerItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: _baseColor,
            highlightColor: _highlightColor,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: Constants.primaryRadius,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: _baseColor,
                  highlightColor: _highlightColor,
                  child: Container(
                    height: 14,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Shimmer.fromColors(
                  baseColor: _baseColor,
                  highlightColor: _highlightColor,
                  child: Container(
                    height: 14,
                    width: 150,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
