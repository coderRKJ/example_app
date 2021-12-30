import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash Screen"),
      ),
      body: Center(
        child: TextButton(
          child: const Text("Go to Home Screen"),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("home");
          },
        ),
      ),
    );
  }
}