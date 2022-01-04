import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

// class Splashscreen extends StatelessWidget {
//   const Splashscreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Splash Screen"),
//       ),
//       body: Center(
//         child: TextButton(
//           child: const Text("Go to Home Screen"),
//           onPressed: () {
//             Navigator.of(context).pushReplacementNamed("home");
//           },
//         ),
//       ),
//     );
//   }
// }

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 4,
        navigateAfterSeconds: "home",
        title: const Text(
          'MockGen App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        loadingText: const Text("Loading..."),
        image: Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Theme.of(context).backgroundColor,
        styleTextUnderTheLoader: const TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.blueAccent);
  }
}
