import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/components/form_filed.dart';
import 'package:bookia/features/auth/presentation/widget/header_auth.dart';
import 'package:bookia/features/auth/presentation/widget/rich_text_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ForgetPass_Screen extends StatefulWidget {
  const ForgetPass_Screen({super.key});

  @override
  State<ForgetPass_Screen> createState() => _ForgetPass_ScreenState();
}

class _ForgetPass_ScreenState extends State<ForgetPass_Screen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<Auth_Cubit>();

    return Scaffold(
      appBar: App_Bar(leading: true),
      body: BlocConsumer<Auth_Cubit, Auth_State>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            pushReplacement(context, Routes.OTP);
            cubit.isLoading = false;
          } else if (state is AuthErrorState) {
            showErrorDialog(context, state.error);
            cubit.isLoading = false;
          } else {
            cubit.isLoading = true;
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Form(
              key: cubit.FormKeyPass,
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
                    controller: cubit.emailForgetPassword,
                    validator: (value) {
                      if (value!.isEmpty ?? false) {
                        return 'Please Enter Your Email';
                      }
                      return null;
                    },
                  ),
                  Gap(40),
                  Main_Button(
                    isLoading: cubit.isLoading,
                    title: 'Send Code',
                    onPress: () {
                      if (cubit.FormKeyPass.currentState?.validate() ?? true) {
                        cubit.forget_password();
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
          );
        },
      ),
    );
  }
}
