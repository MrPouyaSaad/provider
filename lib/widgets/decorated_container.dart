import 'package:flutter/material.dart';

import '../common/const.dart';

class MyDecoratedContainer extends StatelessWidget {
  const MyDecoratedContainer({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.isOutlined = false,
  });

  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final bool isOutlined;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).colorScheme;
    return Container(
      padding: padding ?? EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: Constants.primaryBoxShadow(context),
        borderRadius: Constants.primaryRadius,
        color: isOutlined ? themeData.surface : color,
        border: isOutlined
            ? Border.all(width: 1.5, color: color ?? themeData.primary)
            : null,
      ),
      child: child,
    );
  }
}
