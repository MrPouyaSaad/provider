import 'package:flutter/material.dart';

import '../common/const.dart';

class MyDecoratedContainer extends StatelessWidget {
  const MyDecoratedContainer({
    super.key,
    required this.child,
    this.color,
    this.borderRadius,
    this.padding,
    this.gradient,
    this.isOutlined = false,
  });

  final Widget child;
  final Color? color;
  final List<Color>? gradient;
  final EdgeInsetsGeometry? padding;
  final bool isOutlined;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).colorScheme;
    return Container(
      padding: padding ?? EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: isOutlined
            ? null
            : Constants.primaryBoxShadow(context,
                shadowColor: gradient != null ? gradient!.last : null),
        borderRadius: borderRadius ?? Constants.primaryRadius,
        color: isOutlined ? themeData.surface : color ?? themeData.surface,
        gradient: gradient != null ? Constants.myGradient(gradient!) : null,
        border: isOutlined
            ? Border.all(width: 1.5, color: color ?? themeData.primary)
            : null,
      ),
      child: child,
    );
  }
}

class DecoratedContainerWithIcon extends StatelessWidget {
  const DecoratedContainerWithIcon({
    super.key,
    required this.colors,
    required this.icon,
    required this.title,
    required this.caption,
    this.onTap,
  });

  final List<Color> colors;
  final IconData icon;
  final String title;
  final String caption;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Constants.primaryPadding / 2),
        decoration: BoxDecoration(
          borderRadius: Constants.primaryRadius,
          gradient: Constants.myGradient(colors),
          boxShadow: Constants.primaryBoxShadow(context),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Constants.primaryPadding / 8,
                  vertical: Constants.primaryPadding / 6),
              decoration: BoxDecoration(
                borderRadius: Constants.primaryRadius,
                gradient: Constants.myGradient(colors),
              ),
              child: Icon(
                icon,
                color: themeData.colorScheme.surface,
                size: 38,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: themeData.colorScheme.surface,
                      wordSpacing: -1.5,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  caption,
                  style: TextStyle(
                      wordSpacing: -1,
                      fontWeight: FontWeight.bold,
                      color: themeData.colorScheme.surface,
                      fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
