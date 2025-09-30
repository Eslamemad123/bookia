import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/features/auth/presentation/widget/header_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Sucsecc_Screen extends StatelessWidget {
  const Sucsecc_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(App_Assets.successMarkSVG),
          Gap(40),
          Header_Auth(
            Alighn: CrossAxisAlignment.center,

            title: 'Password Changed!',
            subTitle:
                'Your new password must be unique from those previously used.',
          ),
          Gap(60),
          Main_Button(
            title: 'Back To Home',
            onPress: () {
              PupushAndRemoveUntilsh(context, Routes.Main,0);
            },
          ),
        ],
      ),
    );
  }
}
