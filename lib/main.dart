import 'dart:io';
import 'package:bullet_pro/Screens/splash_screen.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/bloc/bookbloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getTemporaryDirectory();
  Hive.init(dir.path);
  await Hive.openBox('auth');
  await Firebase.initializeApp();
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) =>Authbloc() ),
      ChangeNotifierProvider(create: (_) =>Bookbloc() ),
    ],
      child: MyApp()));

}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  SplashScreen(),
        ),
      );
    });

    super.initState();
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/launcher_icon');
    final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(onDidReceiveLocalNotification:reciev);
    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                '20',
                'bulletprooo',
                importance: Importance.high,
                playSound: true,
                showProgress: true,
                enableLights: true,
                enableVibration: true,
                fullScreenIntent: true,
                priority: Priority.high,
                ticker: 'test ticker',
              ),)
        );
      }
    });
  }

  void reciev(int id, String title, String body, String payload) {
  }

  void onSelectNotification(String payload) {

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
