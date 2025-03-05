// import 'package:coinboost/screens/HomeScreen.dart';f
import 'package:coinboost/screens/onboardingScreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Onboardingscreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center the image
        child: Image.asset(
          "assets/coin.png",
          fit: BoxFit.contain, // Ensure it fits well
          width: 200, // Adjust size if necessary
        ),
      ),
    );
  }
}
