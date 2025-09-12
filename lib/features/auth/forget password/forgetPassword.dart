import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/navigation.dart';
import 'package:bookia/features/auth/login/page/loginScreen.dart';
import 'package:bookia/features/auth/new%20password/newPassword.dart';
import 'package:bookia/features/auth/otp/OTP.dart';
import 'package:bookia/features/auth/widget/form_filed.dart';
import 'package:bookia/features/auth/widget/header_auth.dart';
import 'package:bookia/features/auth/widget/rich_text_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgetPass_Screen extends StatelessWidget {
  ForgetPass_Screen({super.key});
  var FormKeyPass = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(leading: true),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Form(
          key: FormKeyPass,
          child: Column(
            children: [
              Gap(30),
              Header_Auth(
                title: 'Forgot ord?',
                subTitle:
                    'Don\'t worry! It occurs. Please enter the email address linked with your account.',
              ),
              Gap(40),
              Form_Filed(
                text: 'Enter Your Email',
                onChange: (value) {},
                validator: (value) {
                  if (value!.isEmpty ?? false) {
                    return 'Please Enter Your Email';
                  }
                },
              ),
              Gap(40),
              Main_Button(
                title: 'Send Code',
                onPress: () {
                  if (FormKeyPass.currentState?.validate() ?? true) {
                    pushReplacement(context, OTP_Screen());
                  }
                },
              ),
              Expanded(
                child: Rich_TextAuth(
                  textBlack: 'Remember Password?',
                  textGold: 'Login',
                  onPress: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
