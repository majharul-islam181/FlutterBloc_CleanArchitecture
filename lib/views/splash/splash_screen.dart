import 'package:flutter/material.dart';
import 'package:flutterbloc_cleanarchitecture/config/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.homeScreen);
              },
              child: const Text("Home"))),
    );
  }
}
