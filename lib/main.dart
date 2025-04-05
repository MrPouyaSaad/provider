import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vizi_dasht/firebase_options.dart';
import 'package:vizi_dasht/root.dart';
import 'common/theme/theme.dart';

//? create channel
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.max,
);
// تنظیمات نوتیفیکیشن محلی (برای نمایش نوتیف در حالت foreground)
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("📩 پیام دریافت شد در پس‌زمینه: ${message.notification?.title}");
}

//! backgrond notification
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final firebaseNessaging = FirebaseMessaging.instance;
  final fcmToken = await firebaseNessaging.getToken();
  log("FCM Token :$fcmToken");

  // // راه‌اندازی Firebase
  // try {
  //   await Firebase.initializeApp();
  // } catch (e) {
  //   log("❌ خطا در مقداردهی اولیه Firebase: $e");
  // }

  // // تنظیم کانال نوتیفیکیشن برای اندروید
  // const AndroidNotificationChannel channel = AndroidNotificationChannel(
  //   'high_importance_channel', // همان ID که در AndroidManifest.xml تعریف کردید
  //   'High Importance Notifications',

  //   importance: Importance.high,
  //   playSound: true,
  // );

  // // راه‌اندازی نمایش نوتیفیکیشن‌های محلی
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   log("📩 پیام جدید (foreground یا background): ${message.notification?.title}");
  //   RemoteNotification? notification = message.notification;
  //   AndroidNotification? android = message.notification?.android;

  //   if (notification != null && android != null) {
  //     flutterLocalNotificationsPlugin.show(
  //       notification.hashCode,
  //       notification.title,
  //       notification.body,
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(
  //           'high_importance_channel', // همان ID کانال
  //           'High Importance Notifications',
  //           icon: android.smallIcon, // تغییر به آیکون مناسب نوتیفیکیشن
  //         ),
  //       ),
  //     );
  //   }
  // });

  // // تنظیم هندلر پیام‌های پس‌زمینه
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // final InitializationSettings initializationSettings = InitializationSettings(
  //   android: AndroidInitializationSettings('ic_notif'),
  // );

  // await flutterLocalNotificationsPlugin.initialize(initializationSettings);

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
          child: RootScreen(),
        ),
      ),
    );
  }
}
