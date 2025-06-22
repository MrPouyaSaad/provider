import 'package:flutter/material.dart';
import 'package:vizi_dasht/common/const.dart';

class LabelContainer extends StatelessWidget {
  const LabelContainer({
    super.key,
    this.color,
    this.gradient,
    this.child,
    this.text = 'برچسب',
    this.padding,
  });
  final List<Color>? gradient;
  final Color? color;
  final Widget? child;
  final String text;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      padding: padding ?? EdgeInsets.symmetric(vertical: 3, horizontal: 9),
      decoration: BoxDecoration(
        gradient: gradient != null ? Constants.myGradient(gradient!) : null,
        color: gradient == null ? color ?? themeData.colorScheme.primary : null,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child ??
          Text(
            text,
            style: TextStyle(
                color: themeData.colorScheme.surface,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
    );
  }
}
