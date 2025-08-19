import 'package:flutter/material.dart';

import '../common/const.dart';

class CustomShadowBox extends StatelessWidget {
  const CustomShadowBox({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final padding = Constants.primaryPadding / 2;
    return Container(
      padding: EdgeInsets.fromLTRB(padding, padding * 2, padding, padding),
      decoration: BoxDecoration(
        color: themeData.colorScheme.surface,
        borderRadius: Constants.primaryRadius,
        boxShadow: Constants.primaryBoxShadow(context, colorOpacity: 0.03),
      ),
      child: child,
    );
  }
}
