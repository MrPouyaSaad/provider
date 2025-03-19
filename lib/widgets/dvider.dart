import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/const.dart';

class MyDivider extends StatelessWidget {
  final Color? color;
  const MyDivider({
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Divider(
            color: color ?? themeData.colorScheme.secondary.withOpacity(0.25))
        .marginSymmetric(vertical: Constants.primaryPadding, horizontal: 4);
  }
}
