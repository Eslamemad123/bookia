import 'dart:developer';

import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/services/local/LocalHelper.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/splash/widget/start_screen_logo.dart';
import 'package:bookia/features/welcom/welcom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Local_helper.getUserData().then((value) {
        if (value != null) {
          pushReplacement(context, Routes.Main);
        } else {
          pushReplacement(context, Routes.welcom);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: startScreenLogo(gap: 10));
  }
}
