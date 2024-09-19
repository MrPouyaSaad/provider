import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/const.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Divider(color: themeData.colorScheme.secondary)
        .marginOnly(top: Constants.primaryPadding, left: 4, right: 4);
  }
}
