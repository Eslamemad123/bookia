import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/navigation.dart';
import 'package:bookia/features/auth/password%20changed/passChanged.dart';
import 'package:bookia/features/auth/widget/form_filed.dart';
import 'package:bookia/features/auth/widget/header_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewPassword_Screen extends StatelessWidget {
  NewPassword_Screen({super.key});
  var FormKeyNewPass = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(leading: true),
      body: Form(
        key: FormKeyNewPass,
        child: Column(
          children: [
            Gap(30),
            Header_Auth(
              title: 'Create new password',
              subTitle:
                  'Your new password must be unique from those previously used.',
            ),
            Gap(40),
            Form_Filed(
              text: 'New Password',
              icon: true,
              obscureText: true,
              onChange: (value) {},
              validator: (value) {
                if (value!.isEmpty ?? false) {
                  return 'Please Enter New Password';
                }
              },
            ),
            Gap(20),
            Form_Filed(
              text: 'Confirm Password',
              icon: true,
              obscureText: true,
              onChange: (value) {},
              validator: (value) {
                if (value!.isEmpty ?? false) {
                  return 'Please Enter Confirm Password';
                }
              },
            ),
            Gap(40),
            Main_Button(
              title: 'Reset Password',
              onPress: () {
                if (FormKeyNewPass.currentState?.validate() ?? true) {
                  pushReplacement(context, PassChanged_Screen());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
