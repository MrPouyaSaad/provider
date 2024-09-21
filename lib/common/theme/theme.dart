import 'package:flutter/material.dart';
import 'package:provider/common/const.dart';

// const String iranSans = 'iran-sans';
const String iranSans = 'yekan-bakh';
const primaryColor = Color(0XFF3B82F6);
//const primaryColor = Color(0XFF0b5c74);
final secondary = Colors.grey.shade600;

class MyTheme {
  static final lightTheme = ThemeData(
    fontFamily: iranSans,

    //? Text Theme
    textTheme: TextTheme(
      bodySmall: TextStyle(color: Colors.grey.shade600),
      bodyLarge: TextStyle(fontSize: 12),
    ),

    //? Input Decoraation
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      disabledBorder: OutlineInputBorder(
          borderRadius: Constants.primaryRadius,
          borderSide: BorderSide(color: secondary, width: 1.5)),
      outlineBorder: BorderSide(color: primaryColor, width: 1.5),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondary, width: 1.5),
          borderRadius: Constants.primaryRadius),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor, width: 2),
          borderRadius: Constants.primaryRadius),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: secondary, width: 1.5),
          borderRadius: Constants.primaryRadius),
      prefixIconColor: secondary,
      hintStyle: const TextStyle(fontSize: 12),
      suffixStyle: TextStyle(color: secondary),
      suffixIconColor: primaryColor,
      labelStyle: const TextStyle(fontSize: 13),
      alignLabelWithHint: true,
      floatingLabelStyle: const TextStyle(fontSize: 13),
      focusColor: primaryColor,
    ),
    //? floating action button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xff22A699),
      shape: RoundedRectangleBorder(borderRadius: Constants.primaryRadius),
    ),
    //? App Bar
    appBarTheme: const AppBarTheme(
      foregroundColor: primaryColor,
      titleTextStyle: TextStyle(
          fontSize: 16,
          fontFamily: iranSans,
          color: primaryColor,
          wordSpacing: -2),
    ),
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      primaryFixed: const Color(0XFF3B82F6),
      primaryFixedDim: const Color(0xff2563eb),
      onPrimary: const Color(0xfff2f2f2),
      surface: Colors.white,
      onSurface: const Color(0xff101010),
      secondary: secondary,
      errorContainer: const Color(0xffef4444),
      surfaceDim: const Color(0xffdc2626),
      surfaceContainerHighest: const Color(0xff22A699),
      surfaceContainerHigh: const Color(0xff1a7f75),
      secondaryContainer: const Color(0xffFFB000),
      secondaryFixed: const Color(0xffeab308),
      secondaryFixedDim: const Color(0xffca8a04),
      tertiary: const Color(0xff22c55e),
      tertiaryFixedDim: const Color(0xff16a34a),
    ),
    useMaterial3: true,
  );
}
