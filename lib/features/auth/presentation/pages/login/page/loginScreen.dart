import 'dart:developer';

import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/pages/forgetPassword/forgetPassword.dart';
import 'package:bookia/features/auth/presentation/pages/login/widget/logo_login.dart';
import 'package:bookia/features/auth/presentation/pages/register/Register.dart';
import 'package:bookia/components/form_filed.dart';
import 'package:bookia/features/auth/presentation/widget/header_auth.dart';
import 'package:bookia/features/auth/presentation/widget/rich_text_auth.dart';
import 'package:bookia/features/welcom/welcom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Login_Screen extends StatefulWidget {
  Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<Auth_Cubit>();
    return Scaffold(
      appBar: App_Bar(leading: true),
      body: BlocConsumer<Auth_Cubit, Auth_State>(
        listener: _Check_StateListener,
        builder: (BuildContext context, Auth_State state) {
          return Form(
            key: cubit.formKeyLogin,
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
                    controller: cubit.emailLogin,
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
                    controller: cubit.passwordLogin,
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
                            pushReplacement(context, Routes.forgetPassword);
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
                      if (cubit.formKeyLogin.currentState?.validate() ??
                          false) {
                        cubit.login();
                      }
                    },
                    isLoading: cubit.isLoading,
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
                        pushReplacement(context, Routes.register);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _Check_StateListener(BuildContext context, Auth_State state) {
    var cubit = context.read<Auth_Cubit>();
    if (state is AuthSuccessState) {
      pushTo(context, Routes.Home);
      cubit.isLoading = false;
    } else if (state is AuthErrorState) {
      //Pop(context);
      showErrorDialog(context, 'Erroooooooooor');
      cubit.isLoading = false;
      // Pop(context);
    } else {
      cubit.isLoading = true;
    }
  }
}
