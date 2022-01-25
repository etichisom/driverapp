import 'dart:io';

import 'package:bullet_pro/Screens/splash_screen.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/bloc/bookbloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main()async {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) =>Authbloc() ),
      ChangeNotifierProvider(create: (_) =>Bookbloc() ),
    ],
      child: MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getTemporaryDirectory();
  Hive.init(dir.path);
  await Hive.openBox('auth');
  await Firebase.initializeApp();
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
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
