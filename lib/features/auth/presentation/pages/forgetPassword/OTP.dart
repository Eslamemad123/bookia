import 'dart:developer';

import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/widget/header_auth.dart';
import 'package:bookia/features/auth/presentation/widget/rich_text_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OTP_Screen extends StatelessWidget {
  const OTP_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<Auth_Cubit>();
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: TextStyle(
        fontSize: 22,
        color: App_Color.black2,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: App_Color.borderFormFiled), // أسود مبدئياً
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: App_Color.goldPrimary), // ذهبي عند التركيز
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(
          color: App_Color.goldPrimary,
        ), // يثبت ذهبي بعد الكتابة
      ),
    );

    return Scaffold(
      appBar: App_Bar(leading: true),
      body: BlocConsumer<Auth_Cubit, Auth_State>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            pushReplacement(context, Routes.createNewPassword, cubit.OTP);
            cubit.isLoading = false;
          } else if (state is AuthErrorState) {
            show_Dialog(context, 'OTP is incorrect');
            cubit.isLoading = false;
          } else {
            cubit.isLoading = true;
          }
        },
        builder:
            (BuildContext context, Auth_State state) => Form(
              key: cubit.OTPKey,
              child: SingleChildScrollView(
                child: Padding(
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

                      Pinput(
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        validator: (value) {
                          if (value!.isEmpty ?? true) {
                            return 'Please enter OTP';
                          }
                          return null;
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) => print(pin),
                        controller: cubit.OTP,
                      ),

                      Gap(150),
                      Main_Button(
                        isLoading: cubit.isLoading,
                        title: 'Verify',
                        onPress: () {
                          if (cubit.OTPKey.currentState?.validate() ?? false) {
                            log(cubit.OTP.toString());

                            cubit.check_OTP();
                          }
                        },
                      ),
                      Expanded(
                        child: Rich_TextAuth(
                          textBlack: 'Didn’t received code?',
                          textGold: 'Resend',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
