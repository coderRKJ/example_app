import 'package:example_app/home_screen.dart';
import 'package:example_app/new_screen.dart';
import 'package:example_app/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      routes: {
        "new_page": (context) => const Screen(),
        "home": (context) =>
            const MyHomePage(title: 'Flutter Counter Home Page'),
      },
      home: const SplashScreen(),
    );
  }
}
