import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/navigation.dart';
import 'package:bookia/features/auth/new%20password/newPassword.dart';
import 'package:bookia/features/auth/widget/header_auth.dart';
import 'package:bookia/features/auth/widget/rich_text_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OTP_Screen extends StatelessWidget {
  const OTP_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(leading: true),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Gap(30),
            Header_Auth(
              
              title: 'OTP Verification',
              subTitle:
                  'Enter the verification code we just sent on your email address.',
            ),
            Gap(30),
        
            //OTP FILED
        
            Gap(150),
            Main_Button(title: 'Verify', onPress: (){pushReplacement(context, NewPassword_Screen());}),
            Expanded(child: Rich_TextAuth(textBlack: 'Didn’t received code?', textGold: 'Resend'))
        
          ],
        ),
      ),
    );
  }
}
