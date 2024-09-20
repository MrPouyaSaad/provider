import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/common/theme/theme.dart';
import 'package:provider/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <
        MediaQuery.of(context).size.height) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
    final mediaQueryData = MediaQuery.of(context);
    final constrainedTextScaleFactor = mediaQueryData.textScaler.clamp(
      minScaleFactor: 0.8,
      maxScaleFactor: 1,
    );
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaler: constrainedTextScaleFactor),
      child: MaterialApp(
        title: 'Visita Provider',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme,
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: const RootScreen(),
        ),
      ),
    );
  }
}
