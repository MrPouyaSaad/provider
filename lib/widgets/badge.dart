import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:vizi_dasht/common/const.dart';

class CounterBadge extends StatelessWidget {
  const CounterBadge({
    super.key,
    this.value = 0,
    this.isActive = false,
    this.color,
    this.gradient,
  });
  final int value;
  final bool isActive;
  final Color? color;
  final List<Color>? gradient;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Visibility(
      visible: value > 0,
      child: Container(
        height: 18,
        width: 18,
        //  padding: EdgeInsets.all(isActive ? 1.5 : 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: isActive
              ? Border.all(width: 1, color: themeData.colorScheme.primary)
              : null,
          shape: BoxShape.circle,
          gradient: gradient != null ? Constants.myGradient(gradient!) : null,
          color: gradient == null
              ? isActive
                  ? themeData.colorScheme.surface
                  : color ?? themeData.colorScheme.primary
              : null,
        ),
        child: Center(
          child: Text(
            value.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isActive
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.surface,
            ),
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
      this.value = 0,
      this.child,
      this.color,
      this.gradient,
      this.minRadius = 10,
      this.maxRadius = 14,
      this.duration = 500,
      this.ripplesCount = 3});
  final bool? isActive;
  final int value;
  final Widget? child;
  final Color? color;
  final double minRadius;
  final double maxRadius;
  final int duration;
  final int ripplesCount;
  final List<Color>? gradient;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: child != null || value > 0,
      child: RippleAnimation(
        child: child ??
            CounterBadge(
              gradient: gradient,
              color: color,
              value: value,
              isActive: isActive ?? false,
            ),
        color: color ?? Theme.of(context).primaryColor,
        delay: const Duration(milliseconds: 350),
        repeat: true,
        minRadius: minRadius,
        maxRadius: maxRadius,
        ripplesCount: ripplesCount,
        duration: Duration(milliseconds: ripplesCount * duration),
      ),
    );
  }
}
