import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/form_filed.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_Cubit.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Delete_Account extends StatelessWidget {
  Delete_Account({super.key});
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Profile_Cubit, Profile_State>(
      listener: (context, state) {
        if (state is ProfileLoading) {
          isLoading = true;
        } else if (state is ProfileSuccess) {
          isLoading = false;
          PupushAndRemoveUntilsh(context, Routes.welcom);
        } else if (state is ProfileError) {
          isLoading = false;
          show_Dialog(context, 'Error');
        }
      },
      builder: (context, state) {
        var cubit = context.read<Profile_Cubit>();

        return Scaffold(
          appBar: App_Bar(leading: true),
          body: SingleChildScrollView(
            child: Form(
              key: cubit.deleteAccountKey,
              child: Column(
                children: [
                  Gap(50),
                  Center(
                    child: Text(
                      'Delete Account',
                      style: Text_Style.getText30(),
                    ),
                  ),
                  Gap(50),
                  Form_Filed(
                    controller: cubit.CurrentPassword,
                    text: 'Current Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your Current Password';
                      }
                    },
                  ),
                  Gap(25),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Main_Button(
              isLoading: isLoading,
              title: 'Delete!',
              onPress: () {
                if (cubit.deleteAccountKey.currentState!.validate()) {
                  cubit.deleteAccount();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
