import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'common/theme/theme.dart';

// تنظیمات نوتیفیکیشن محلی (برای نمایش نوتیف در حالت foreground)
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("📩 پیام دریافت شد در پس‌زمینه: ${message.notification?.title}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // راه‌اندازی Firebase
  try {
    await Firebase.initializeApp();
  } catch (e) {
    log("❌ خطا در مقداردهی اولیه Firebase: $e");
  }

  // تنظیم کانال نوتیفیکیشن برای اندروید
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // همان ID که در AndroidManifest.xml تعریف کردید
    'High Importance Notifications',

    importance: Importance.high,
    playSound: true,
  );

  // راه‌اندازی نمایش نوتیفیکیشن‌های محلی
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    log("📩 پیام جدید (foreground یا background): ${message.notification?.title}");
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel', // همان ID کانال
            'High Importance Notifications',
            icon: android.smallIcon, // تغییر به آیکون مناسب نوتیفیکیشن
          ),
        ),
      );
    }
  });

  // تنظیم هندلر پیام‌های پس‌زمینه
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final InitializationSettings initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings('ic_notif'),
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

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
          child: NotificationScreen(),
        ),
      ),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String? _token;

  @override
  void initState() {
    super.initState();
    _setupFCM();
    _requestNotificationPermissions();
    _checkInitialMessage();
  }

  void _checkInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      log("🚀 نوتیف کلیک شد در حالت Terminated: ${initialMessage.notification?.title}");
    }
  }

  void _requestNotificationPermissions() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // درخواست مجوز (برای اندروید 13+)
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      log("❌ کاربر مجوز نوتیفیکیشن را رد کرد.");
    } else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log("✅ نوتیفیکیشن فعال است.");
    }
  }

  void _setupFCM() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // دریافت توکن دستگاه
    _token = await messaging.getToken();
    if (_token != null) {
      log("🎯 توکن دستگاه: $_token");
    } else {
      log("⚠️ دریافت توکن با مشکل مواجه شد!");
    }

    // تنظیم هندلر برای نوتیفیکیشن‌های foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("📩 پیام جدید (foreground): ${message.notification?.title}");

      // نمایش نوتیفیکیشن در حالت foreground
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel', // همان ID کانال
              'High Importance Notifications',
              icon: 'ic_notif', // آیکون مناسب نوتیفیکیشن
            ),
          ),
        );
      }
    });

    // هندلر کلیک روی نوتیفیکیشن
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("🚀 نوتیف کلیک شد: ${message.notification?.title}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${message.notification?.title}")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FCM Test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("توکن دستگاه: $_token"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // تست دریافت توکن جدید
                _token = await FirebaseMessaging.instance.getToken();
                setState(() {});
              },
              child: Text("بروزرسانی توکن"),
            ),
          ],
        ),
      ),
    );
  }
}
