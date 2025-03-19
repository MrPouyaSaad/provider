import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class CounterBadge extends StatelessWidget {
  const CounterBadge({
    super.key,
    required this.value,
    this.isActive = false,
  });
  final int value;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Visibility(
      visible: value > 0,
      child: Container(
        height: 20,
        width: 20,
        padding: EdgeInsets.all(isActive ? 2 : 2.5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: isActive
              ? Border.all(width: 1, color: themeData.colorScheme.primary)
              : null,
          shape: BoxShape.circle,
          color: isActive
              ? themeData.colorScheme.surface
              : themeData.colorScheme.primary,
        ),
        child: Text(
          value.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: isActive
                ? themeData.colorScheme.primary
                : themeData.colorScheme.surface,
          ),
        ),
      ),
    );
  }
}

class RippleBadge extends StatelessWidget {
  const RippleBadge(
      {super.key,
      this.isActive = false,
      this.value,
      this.child,
      this.color,
      this.minRadius = 10,
      this.maxRadius = 14,
      this.duration = 500,
      this.ripplesCount = 3});
  final bool? isActive;
  final int? value;
  final Widget? child;
  final Color? color;
  final double minRadius;
  final double maxRadius;
  final int duration;
  final int ripplesCount;
  @override
  Widget build(BuildContext context) {
    return RippleAnimation(
      child: child ??
          CounterBadge(
            value: value ?? 0,
            isActive: isActive ?? false,
          ),
      color: color ?? Theme.of(context).primaryColor,
      delay: const Duration(milliseconds: 350),
      repeat: true,
      minRadius: minRadius,
      maxRadius: maxRadius,
      ripplesCount: ripplesCount,
      duration: Duration(milliseconds: ripplesCount * duration),
    );
  }
}
