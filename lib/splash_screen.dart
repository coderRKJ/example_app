import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:example_app/models/count_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterModel(),
      child: Scaffold(
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
      ),
    );
  }
}
