import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Constants {
  //!
  static final primaryRadius = BorderRadius.circular(9.0);
  static const primaryRadiusValue = 9.0;
  static const double primaryPadding = 16.0;
  static const double productItemHeight = 300;
  static const double primaryButtonHeight = 52;

  //static final duration = 180.ms;
  static final duration = 180.ms;
  static const animationCurve = Curves.ease;
  //!
  // static Animate itemAnimation(
  //     {required Widget widget, Duration? delay, Duration? duration}) {
  //   return widget
  //       .animate(delay: 100.ms)
  //       .fade(duration: duration ?? Constants.duration, delay: delay)
  //       .scale(duration: Constants.duration, curve: Constants.animationCurve);
  // }

  //!
  static List<BoxShadow> primaryBoxShadow(BuildContext context) {
    return [
      BoxShadow(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.125),
        blurRadius: 9,
      ),
    ];
  }

  //!
  static void dismisTextField(event) =>
      FocusManager.instance.primaryFocus?.unfocus();
}
