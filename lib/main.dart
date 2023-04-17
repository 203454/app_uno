import 'package:app_uno/pages/HomeLogin.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:app_uno/pages/HomeAlternative.dart';
import 'package:app_uno/pages/home_practica.dart';
import 'package:app_uno/pages/notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await initNotifications();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: "basic_channel",
        channelName: "Basic Notifications",
        channelDescription: "notification channel description")
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            // backgroundColor: Color.fromARGB(255, 198, 198, 198),
            ),
        // primarySwatch: Colors.red,
        // primarySwatch: Colors.blue,
        // brightness:Brightness.dark
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
        // bottomAppBarTheme: const BottomAppBarTheme(
        //   color: Color.fromARGB(255, 17, 0, 255),
        // ),
      ),
      home: HomeLogin(),
    );
  }
}
