import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/navigation.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/auth/forget%20password/forgetPassword.dart';
import 'package:bookia/features/auth/login/widget/logo_login.dart';
import 'package:bookia/features/auth/register/Register.dart';
import 'package:bookia/features/auth/widget/form_filed.dart';
import 'package:bookia/features/auth/widget/header_auth.dart';
import 'package:bookia/features/auth/widget/rich_text_auth.dart';
import 'package:bookia/features/welcom/welcom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Login_Screen extends StatelessWidget {
  Login_Screen({super.key});
  var formKeyLogin = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(leading: true),
      body: Form(
        key: formKeyLogin,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              Header_Auth(title: 'Welcome back! Glad \nto see you, Again!'),
              Gap(30),

              Form_Filed(
                text: 'Login',
                onChange: (value) {},
                validator: (value) {
                  if (value!.isEmpty ?? true) {
                    return 'Please enter your Email';
                  }
                },
              ),
              Gap(25),

              Form_Filed(
                text: 'Password',
                icon: true,
                obscureText: true,
                onChange: (value) {},
                validator: (value) {
                  if (value!.isEmpty ?? true) {
                    return 'Please enter your Password';
                  }
                },
              ),
              Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        pushReplacement(context, ForgetPass_Screen());
                      },
                      child: Text(
                        'Forget Password',
                        style: Text_Style.getText14(
                          color: App_Color.textgreydark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(30),
              Main_Button(
                title: 'Login',
                onPress: () {
                  if (formKeyLogin.currentState?.validate() ?? false) {
                    PupushAndRemoveUntilsh(context, Welcom_Screen());
                  }
                },
              ),
              Gap(40),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      endIndent: 15,
                      indent: 22,
                      color: App_Color.borderFormFiled,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Or login with',
                      style: Text_Style.getText14(
                        color: App_Color.textgreydark,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      endIndent: 22,
                      indent: 15,
                      color: App_Color.borderFormFiled,
                    ),
                  ),
                ],
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: LogoLogin(
                        logo: SvgPicture.asset(App_Assets.facebookLogoSVG),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: LogoLogin(
                        logo: SvgPicture.asset(App_Assets.googleLogoSVG),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: LogoLogin(
                        logo: SvgPicture.asset(App_Assets.appleLogoSVG),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Rich_TextAuth(
                  textBlack: 'Don\'t have an account?',
                  textGold: 'Register Now',
                  onPress: () {
                    pushReplacement(context, Register_Screen());
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
