import 'dart:developer';

import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/pages/login/page/loginScreen.dart';
import 'package:bookia/components/form_filed.dart';
import 'package:bookia/features/auth/presentation/widget/header_auth.dart';
import 'package:bookia/features/auth/presentation/widget/rich_text_auth.dart';
import 'package:bookia/features/welcom/welcom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Register_Screen extends StatefulWidget {
  Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<Auth_Cubit>();
    return Scaffold(
      appBar: App_Bar(leading: true),
      body: BlocConsumer<Auth_Cubit, Auth_State>(
        listener: _Check_StateListener,
        builder: (BuildContext context, Auth_State state) {
          return Form(
            key: cubit.FormKeyRegister,
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
                    controller: cubit.name,
                    validator: (value) {
                      if (value!.isEmpty ?? true) {
                        return 'Please enter your name';
                      }
                    },
                  ),
                  Gap(15),
                  Form_Filed(
                    text: 'Email',
                    controller: cubit.emailRegister,
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
                    controller: cubit.passRegister,
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
                    controller: cubit.confirmPass,
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
                      if (cubit.FormKeyRegister.currentState!.validate()) {
                        cubit.register();
                      }
                    },
                    isLoading: cubit.isLoading,
                  ),
                  Expanded(
                    child: Rich_TextAuth(
                      textBlack: 'Already have an account?',
                      textGold: 'Login Now',
                      onPress: () {
                        pushReplacement(context, Routes.login);
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
      pushReplacement(context, Routes.login);
      cubit.isLoading = false;
    } else if (state is AuthErrorState) {
      showErrorDialog(context, state.error);
      cubit.isLoading = false;
    } else {
      cubit.isLoading = true;
    }
  }
}
