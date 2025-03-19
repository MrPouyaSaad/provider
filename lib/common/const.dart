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
  static List<BoxShadow> primaryBoxShadow(BuildContext context,
      {Color? shadowColor = null,
      double blurRadius = 6,
      double colorOpacity = 0.08}) {
    final themeData = Theme.of(context).colorScheme;
    return [
      BoxShadow(
        color: shadowColor ??
            themeData.onSurface.withAlpha((colorOpacity * 255).toInt()),
        blurRadius: blurRadius,
      ),
    ];
  }

  //!
  static void dismisTextField(event) =>
      FocusManager.instance.primaryFocus?.unfocus();
}
