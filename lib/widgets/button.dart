import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizi_dasht/common/const.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key,
    this.title = "",
    this.onTap,
    this.isPadding = true,
    this.icon,
    this.style,
    this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.gradient,
  });

  final String title;
  final TextStyle? style;
  final Icon? icon;
  final Widget? child;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final List<Color>? gradient;
  final bool isPadding;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) icon!,
        if (icon != null && (child != null || title.isNotEmpty))
          const SizedBox(width: 8),
        child ??
            Text(
              title,
              style: style ??
                  TextStyle(
                    color: foregroundColor ?? themeData.colorScheme.surface,
                    fontWeight: FontWeight.bold,
                  ),
            ),
      ],
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(Constants.primaryRadiusValue),
        child: Ink(
          decoration: BoxDecoration(
            gradient: gradient != null ? Constants.myGradient(gradient!) : null,
            color: gradient == null
                ? backgroundColor ?? themeData.colorScheme.primary
                : null,
            borderRadius: BorderRadius.circular(Constants.primaryRadiusValue),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(Constants.primaryRadiusValue),
            onTap: onTap,
            child: Padding(
              padding: isPadding
                  ? const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
                  : EdgeInsets.zero,
              child: buttonContent,
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    this.title = "",
    this.onTap,
    this.isPadding = false,
    this.icon,
    this.style,
    this.child,
    this.backgroundColor,
    this.forgroundColor,
  });
  final Function()? onTap;
  final String title;

  final TextStyle? style;
  final Icon? icon;
  final Widget? child;

  final Color? backgroundColor;
  final Color? forgroundColor;
  final bool isPadding;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Material(
      color: themeData.colorScheme.surface,
      child: InkWell(
        borderRadius: Constants.primaryRadius,
        child: Text(
          title,
          style: style ??
              TextStyle(
                  color: onTap != null
                      ? themeData.colorScheme.primary
                      : themeData.colorScheme.secondary),
        ).paddingSymmetric(vertical: 4, horizontal: 8),
        onTap: onTap,
      ),
    );
  }
}
