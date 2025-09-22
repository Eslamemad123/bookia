import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/components/form_filed.dart';
import 'package:bookia/features/auth/presentation/widget/header_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NewPassword_Screen extends StatefulWidget {
  NewPassword_Screen({super.key, required this.otp});
  TextEditingController otp;
  @override
  State<NewPassword_Screen> createState() => _NewPassword_ScreenState();
}

class _NewPassword_ScreenState extends State<NewPassword_Screen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<Auth_Cubit>();
    return Scaffold(
      appBar: App_Bar(leading: true),
      body: BlocConsumer<Auth_Cubit, Auth_State>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            pushTo(context, Routes.passwordChanged);
            cubit.isLoading = false;
          } else if (state is AuthErrorState) {
            showErrorDialog(context, state.error);
            cubit.isLoading = false;
          } else {
            cubit.isLoading = true;
          }
        },
        builder: (context, state) {
          return Form(
            key: cubit.FormKeyNewPass,
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
                  controller: cubit.Newpass,
                  validator: (value) {
                    if (value!.isEmpty ?? false) {
                      return 'Please Enter New Password';
                    }
                    return null;
                  },
                ),
                Gap(20),
                Form_Filed(
                  text: 'Confirm Password',
                  icon: true,
                  obscureText: true,
                  controller: cubit.confirmNewPass,
                  validator: (value) {
                    if (value!.isEmpty ?? false) {
                      return 'Please Enter Confirm Password';
                    }
                    return null;
                  },
                ),
                Gap(40),
                Main_Button(
                  isLoading: cubit.isLoading,
                  title: 'Reset Password',
                  onPress: () {
                    if (cubit.FormKeyNewPass.currentState?.validate() ?? true) {
                      cubit.OTP = widget.otp;
                      cubit.new_password();
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
