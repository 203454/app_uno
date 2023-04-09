import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:app_uno/pages/HomeAlternative.dart';
import 'package:app_uno/pages/home_practica.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
          backgroundColor: Color.fromARGB(255, 255, 13, 13),
        ),
        // primarySwatch: Colors.red,
        // primarySwatch: Colors.blue,
        // brightness:Brightness.dark
        scaffoldBackgroundColor: const Color.fromARGB(255, 58, 58, 58),
      ),
      home: 
      const HomeAlternative(),
    );
  }
}
