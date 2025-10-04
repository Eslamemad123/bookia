import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/form_filed.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_Cubit.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class EditProfile_Screen extends StatelessWidget {
  EditProfile_Screen({super.key});
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Profile_Cubit, Profile_State>(
      listener: (context, state) {
        if (state is ProfileLoading) {
          isLoading = true;
        } else if (state is ProfileSuccess) {
          isLoading = false;
          pushReplacement(context, Routes.Sucsecc);
        } else if (state is ProfileError) {
          isLoading = false;
          show_Dialog(context, 'Error ');
        }
      },
      builder: (context, state) {
        var cubit = context.read<Profile_Cubit>();
        return Scaffold(
          appBar: App_Bar(leading: true, title: 'Edit Profile'),
          body: SingleChildScrollView(
            child: Form(
              key: cubit.updateProfileKey,
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 61,
                          backgroundColor: App_Color.goldPrimary,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: App_Color.gold2,
                            backgroundImage: AssetImage(App_Assets.bookPNG),
                          ),
                        ),

                        Positioned(
                          right: 2,
                          bottom: 2,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: App_Color.formBackGroundColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: SizedBox(
                              width: 10,
                              height: 10,
                              child: Center(
                                child: SvgPicture.asset(
                                  App_Assets.cameraSVG,
                                  width: 25,
                                  height: 25,
                                  colorFilter: ColorFilter.mode(
                                    App_Color.goldPrimary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(50),
                  Form_Filed(
                    controller: cubit.FullName,

                    text: 'Full Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your name';
                      }
                    },
                  ),
                  Gap(20),
                  Form_Filed(
                    controller: cubit.Phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    text: 'Phone',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your phone';
                      }
                    },
                  ),
                  Gap(20),
                  Form_Filed(
                    controller: cubit.Address,

                    text: 'Address',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your address';
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Main_Button(
              isLoading: isLoading,
              title: 'Update Profile',
              onPress: () {
                if (cubit.updateProfileKey.currentState!.validate()) {
                  cubit.updateProfile();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
