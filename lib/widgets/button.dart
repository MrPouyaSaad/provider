import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    return Directionality(
      textDirection: TextDirection.ltr,
      child: ElevatedButton.icon(
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
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    this.onTap,
    required this.title,
  });
  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Material(
      color: themeData.colorScheme.surface,
      child: InkWell(
        borderRadius: Constants.primaryRadius,
        child: Text(
          title,
          style: TextStyle(
              color: onTap != null
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.secondary),
        ).paddingSymmetric(vertical: 4, horizontal: 8),
        onTap: onTap,
      ),
    );
  }
}
