import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/splash/widget/start_screen_logo.dart';
import 'package:flutter/material.dart';

class Welcom_Screen extends StatelessWidget {
  const Welcom_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(App_Assets.welcomPNG, fit: BoxFit.fill),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: startScreenLogo(gap: 30),
          ),
          Positioned(
            bottom: 160,
            right: 0,
            left: 0,
            child: Main_Button(
              title: 'Login',
              onPress: () {
                pushTo(context, Routes.login);
              },
            ),
          ),
          Positioned(
            right: 22,
            left: 22,
            bottom: 85,
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  pushTo(context, Routes.register);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: App_Color.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: App_Color.black1, width: 1),

                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'ٌRegister',
                  style: Text_Style.getText15(color: App_Color.black1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
