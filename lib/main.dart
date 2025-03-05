import 'package:coinboost/components/counterModel.dart';
import 'package:coinboost/screens/HomeScreen.dart';
import 'package:coinboost/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.robotoMonoTextTheme()),
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
