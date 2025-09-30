import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_Cubit.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_state.dart';
import 'package:bookia/features/profile/presentation/widget/item_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Profile_Cubit()..showProfile(),
      child: BlocConsumer<Profile_Cubit, Profile_State>(
        listener: (context, state) {
          if (state is ProfileLoading) {
            // showLoadingBook(context);
          } else if (state is ProfileSuccess) {
            //  context.pop();
          } else if (state is LogOutSuccess) {
            PupushAndRemoveUntilsh(context, Routes.welcom);
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: CircularProgressIndicator(color: App_Color.goldPrimary),
            );
          }
          var cubit = context.read<Profile_Cubit>();
          return Scaffold(
            backgroundColor: App_Color.formBackGroundColor,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: App_Color.formBackGroundColor,
              title: Text('Profile', style: Text_Style.getText25()),
              actions: [
                IconButton(
                  onPressed: () {
                    cubit.logOut();
                  },
                  icon: SvgPicture.asset(App_Assets.logoutSVG),
                ),
              ],
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Gap(20),
                    Row(
                      children: [
                        ClipOval(
                          child: CircleAvatar(
                            radius: 50,
                            child: Image.network(
                              cubit.showProfileData?.image ?? '',
                            ),
                            backgroundColor: App_Color.gold2,
                          ),
                        ),
                        Gap(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cubit.showProfileData?.name ?? 'NULLLLL!',
                              style: Text_Style.getText20(),
                            ),
                            Gap(6),
                            Text(
                              cubit.showProfileData?.email ?? 'NULLLLL!',

                              style: Text_Style.getText15(
                                color: App_Color.textgreyForm,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(40),
                    ItemProfile(
                      title: 'My Orders',
                      onPress: () {
                        pushTo(context, Routes.orderHistory);
                      },
                    ),
                    Gap(10),
                    ItemProfile(
                      title: 'Edit Profile',
                      onPress: () {
                        pushTo(context, Routes.editProfile);
                      },
                    ),
                    Gap(10),
                    ItemProfile(
                      title: 'Reset Password',
                      onPress: () {
                        pushTo(context, Routes.UpdatePassword);
                      },
                    ),
                    Gap(10),
                    ItemProfile(title: 'FAQ', onPress: () {}),
                    Gap(10),
                    ItemProfile(title: 'Contact Us', onPress: () {}),
                    Gap(10),
                    ItemProfile(title: 'Privacy & Terms', onPress: () {}),
                    Gap(10),
                    ItemProfile(
                      title: 'Delete Account',
                      onPress: () {
                        pushTo(context, Routes.deleteAccount);
                      },
                    ),
                    Gap(10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
