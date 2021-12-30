import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Screen"),
      ),
      body: Center(
        child: TextButton(
          child: const Text("Go Back"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
