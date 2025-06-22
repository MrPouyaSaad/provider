import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<String> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String appName = packageInfo.appName;
  String packageName = packageInfo.packageName;
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  String formattedVersion = "نسخه $version";

  log("App Name: $appName");
  log("App Version: $version");
  log("Package Name: $packageName");
  log("Build Number: $buildNumber");

  return formattedVersion;
}

class Constants {
  static final appName = 'ویزی دشت';
  //!
  static final primaryRadius = BorderRadius.circular(12.0);
  static const primaryRadiusValue = 12.0;
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

  static final blueGradientColors = [Color(0xFF6A11CB), Color(0xFF2575FC)];
  static final greenGradientColors = [Color(0xFF11998E), Color(0xFF38EF7D)];
  static final redGradientColors = [Color(0xFFFF416C), Color(0xFFFF4B2B)];
  static final pinkGradientColors = [Color(0xFF9C27B0), Color(0xFFE91E63)];
  static final yellowGradientColors = [Color(0xFFFFC107), Color(0xFFFF8F00)];
  static final silverGradientColors = [Color(0xFFB0BEC5), Color(0xFF78909C)];
  static final brownGradientColors = [Color(0xFF8D6E63), Color(0xFF5D4037)];

  static LinearGradient myGradient(List<Color> colors) {
    return LinearGradient(
        begin: Alignment.topLeft, end: Alignment.bottomRight, colors: colors);
  }

  static List<BoxShadow> primaryBoxShadow(BuildContext context,
      {Color? shadowColor = null,
      double blurRadius = 15,
      double colorOpacity = 0.08}) {
    final themeData = Theme.of(context).colorScheme;
    return [
      BoxShadow(
          color: shadowColor != null
              ? shadowColor.withOpacity(0.3)
              : themeData.onSurface.withOpacity(colorOpacity),
          blurRadius: blurRadius,
          spreadRadius: 1,
          offset: Offset(0, 5))
    ];
  }

  //!
  static void dismisTextField(event) =>
      FocusManager.instance.primaryFocus?.unfocus();
}
