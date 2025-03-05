import 'package:coinboost/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
            ),
            Image.asset(
              "assets/coin.png",
              height: 194,
              width: 219,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 59,
            ),
            Image.asset(
              "assets/piggiBank.png",
              height: 250,
              width: 250,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 88,
            ),
            Material(
              elevation: 5,
              shadowColor: Colors.grey.withOpacity(1),
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 48,
                width: 307,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Enter Your Mobile Number",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Material(
              elevation: 5,
              shadowColor: Colors.grey.withOpacity(1),
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                },
                child: Container(
                  height: 48,
                  width: 307,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber[800],
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
