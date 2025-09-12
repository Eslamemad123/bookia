import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/features/splash/page/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DM Serif Display',
        scaffoldBackgroundColor: App_Color.white,
      ),
      home: SplashScreen()
      );
    
  }
}
