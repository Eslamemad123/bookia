import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/navigation.dart';
import 'package:bookia/features/auth/login/page/loginScreen.dart';
import 'package:bookia/features/auth/widget/form_filed.dart';
import 'package:bookia/features/auth/widget/header_auth.dart';
import 'package:bookia/features/auth/widget/rich_text_auth.dart';
import 'package:bookia/features/welcom/welcom.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Register_Screen extends StatelessWidget {
  Register_Screen({super.key});
  var FormKeyRegister = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(leading: true),
      body: Form(
        key: FormKeyRegister,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              Header_Auth(title: 'Hello! Register to get \n started'),
              Gap(40),
              Form_Filed(
                text: 'User Name',
                onChange: (value) {},
                validator: (value) {
                  if (value!.isEmpty ?? true) {
                    return 'Please enter your name';
                  }
                },
              ),
              Gap(15),
              Form_Filed(
                text: 'Email',
                onChange: (value) {},
                validator: (value) {
                  if (value!.isEmpty ?? true) {
                    return 'Please enter your name';
                  }
                },
              ),
              Gap(15),
              Form_Filed(
                text: 'Password',
                icon: true,
                obscureText: true,
                onChange: (value) {},
                validator: (value) {
                  if (value!.isEmpty ?? true) {
                    return 'Please enter your name';
                  }
                },
              ),
              Gap(15),
              Form_Filed(
                text: 'Confirm Password',
                obscureText: true,
                icon: true,
                onChange: (value) {},
                validator: (value) {
                  if (value!.isEmpty ?? true) {
                    return 'Please enter your name';
                  }
                },
              ),
              Gap(40),
              Main_Button(
                title: 'Register',
                onPress: () {
                  if (FormKeyRegister.currentState?.validate() ?? false) {
                    PupushAndRemoveUntilsh(context, Welcom_Screen());
                  }
                },
              ),
              Expanded(
                child: Rich_TextAuth(
                  textBlack: 'Already have an account?',
                  textGold: 'Login Now',
                  onPress: () {
                    pushReplacement(context, Login_Screen());
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
