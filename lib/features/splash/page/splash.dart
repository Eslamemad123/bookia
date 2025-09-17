import 'dart:ui';

import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/splash/widget/start_screen_logo.dart';
import 'package:bookia/features/welcom/welcom.dart';
import 'package:flutter/cupertino.dart';
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
    Future.delayed(Duration(seconds: 1), () {
      // ignore: use_build_context_synchronously
      pushReplacement(context, Routes.welcom);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: startScreenLogo(gap: 10));
  }
}
