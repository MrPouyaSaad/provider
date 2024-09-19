import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/const.dart';
import '../common/custom_underline.dart';

class DashboardTitle extends StatelessWidget {
  const DashboardTitle(
      {super.key,
      required this.title,
      this.isBottomPadding = true,
      this.subTitle});
  final String title;
  final bool isBottomPadding;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomUnderLine(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              wordSpacing: -2,
            ),
          ),
        ),
        SizedBox(width: 8),
        if (subTitle != null)
          Text(
            subTitle!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
              wordSpacing: -3.5,
            ),
          ),
      ],
    ).marginOnly(
        top: Constants.primaryPadding,
        bottom: isBottomPadding ? Constants.primaryPadding : 0);
  }
}
