import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vizi_dasht/screens/sing_in/sign_in.dart';
import 'common/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        title: 'ViziDasht',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme,
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: SignInScreen(),
        ),
      ),
    );
  }
}
