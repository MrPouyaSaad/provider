import 'package:flutter/material.dart';
import 'package:provider/common/const.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key,
    this.title,
    this.onTap,
    this.icon,
    this.style,
    this.backgroundColor,
    this.forgroundColor,
  });

  final String? title;
  final TextStyle? style;
  final Icon? icon;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? forgroundColor;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.primaryRadiusValue),
        ),
        backgroundColor: backgroundColor ?? themeData.colorScheme.primary,
        foregroundColor: forgroundColor ?? themeData.colorScheme.surface,
      ),
      icon: icon,
      label: Text(
        title!,
        style: style ?? const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
