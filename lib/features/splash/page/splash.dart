import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/services/local/LocalHelper.dart';
import 'package:bookia/features/splash/widget/start_screen_logo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      var userData = Local_helper.getUserData();
      if (userData != null) {
        pushReplacement(context, Routes.Main);
      } else {
        pushReplacement(context, Routes.welcom);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: startScreenLogo(gap: 10));
  }
}
