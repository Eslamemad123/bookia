import 'dart:developer';
import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/form_filed.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/Regix.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20color.dart' show App_Color;
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/Cart/Presentation/cubit/Cart_state.dart';
import 'package:bookia/features/Cart/Presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/auth/presentation/widget/header_auth.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Pleace_Order extends StatelessWidget {
  Pleace_Order({super.key, required this.Total});
  final List<Map> governorate = [
    {"id": 1, "governorate_name_en": "Cairo"},
    {"id": 2, "governorate_name_en": "Giza"},
    {"id": 3, "governorate_name_en": "Alexandria"},
    {"id": 4, "governorate_name_en": "Dakahlia"},
    {"id": 5, "governorate_name_en": "Red Sea"},
    {"id": 6, "governorate_name_en": "Beheira"},
    {"id": 7, "governorate_name_en": "Fayoum"},
    {"id": 8, "governorate_name_en": "Gharbiya"},
    {"id": 9, "governorate_name_en": "Ismailia"},
    {"id": 10, "governorate_name_en": "Menofia"},
    {"id": 11, "governorate_name_en": "Minya"},
    {"id": 12, "governorate_name_en": "Qaliubiya"},
    {"id": 13, "governorate_name_en": "New Valley"},
    {"id": 14, "governorate_name_en": "Suez"},
    {"id": 15, "governorate_name_en": "Aswan"},
    {"id": 16, "governorate_name_en": "Assiut"},
    {"id": 17, "governorate_name_en": "Beni Suef"},
    {"id": 18, "governorate_name_en": "Port Said"},
    {"id": 19, "governorate_name_en": "Damietta"},
    {"id": 20, "governorate_name_en": "Sharkia"},
    {"id": 21, "governorate_name_en": "South Sinai"},
    {"id": 22, "governorate_name_en": "Kafr Al sheikh"},
    {"id": 23, "governorate_name_en": "Matrouh"},
    {"id": 24, "governorate_name_en": "Luxor"},
    {"id": 25, "governorate_name_en": "Qena"},
    {"id": 26, "governorate_name_en": "North Sinai"},
    {"id": 27, "governorate_name_en": "Sohag"},
  ];
  String? Total;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Cart_cubit()..inite(),
      child: Scaffold(
        appBar: App_Bar(leading: true),
        bottomNavigationBar: BlocConsumer<Cart_cubit, Cart_State>(
          listener: (context, state) {
            if (state is LoadingCheckOut) {
              isLoading = true;
            } else if (state is CheckoutSuccessState) {
              isLoading = false;
              pushReplacement(context, Routes.Sucsecc);
            }
          },
          builder: (context, state) {
            var cubit = context.read<Cart_cubit>();
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total After Discound :',
                          style: Text_Style.getText20(color: App_Color.black3),
                        ),
                        Column(
                          children: [
                            Text(
                              '\$ ${Total}',
                              style: Text_Style.getText20(
                                color: App_Color.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gap(15),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Main_Button(
                      isLoading: isLoading,
                      radius: 8,
                      title: 'Submit Order',
                      onPress: () {
                        if (cubit.form_key.currentState!.validate()) {
                          cubit.placeORder();
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        body: BlocBuilder<Cart_cubit, Cart_State>(
          builder: (context, state) {
            var cubit = context.read<Cart_cubit>();
            return Form(
              key: cubit.form_key,
              child: Column(
                children: [
                  Gap(20),
                  Header_Auth(
                    title: 'Place Your Order',
                    subTitle:
                        'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                  ),
                  Gap(30),
                  Form_Filed(
                    text: 'Full Name',
                    controller: cubit.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your name';
                      }
                    },
                  ),
                  Gap(20),
                  Form_Filed(
                    text: 'Email',
                    controller: cubit.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your Email';
                      } else if (!AppRegEx.isEmailValied(cubit.email.text)) {
                        return 'Invalied Email';
                      }
                    },
                  ),
                  Gap(20),
                  Form_Filed(
                    text: 'Address',
                    controller: cubit.address,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your Address';
                      }
                    },
                  ),
                  Gap(20),
                  Form_Filed(
                    text: 'Phone',
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      FilteringTextInputFormatter.deny(' '),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: cubit.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your Phone';
                      } else if (!AppRegEx.isPhoneValied(cubit.phone.text)) {
                        return 'Invalied Phone';
                      }
                    },
                  ),
                  Gap(20),
                  governorateForm(cubit),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  governorateForm(Cart_cubit cubit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField2<int>(
            value: cubit.governorate,
            isExpanded: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: App_Color.formBackGroundColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: App_Color.borderFormFiled,
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: App_Color.borderFormFiled,
                  width: 1,
                ),
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: App_Color.borderFormFiled,
                  width: 1,
                ),
              ),

              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: App_Color.borderFormFiled,
                  width: 1,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: App_Color.borderFormFiled,
                  width: 1,
                ),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: App_Color.borderFormFiled,
                  width: 1,
                ),
              ),
            ),
            hint: Text(
              'Select Your governorate',
              style: Text_Style.getText14(color: App_Color.textgreyForm),
            ),
            items:
                governorate.map((gov) {
                  return DropdownMenuItem<int>(
                    value: gov["id"] as int, // نخزن الـ id
                    child: Text(
                      gov["governorate_name_en"] as String,
                    ), // نعرض الاسم
                  );
                }).toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select Governorate.';
              }
              return null;
            },
            onChanged: (value) {
              //Do something when selected item is changed.
              log('******${cubit.governorate}');
              cubit.governorate = value ?? 1;
            },
            onSaved: (value) {},
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(Icons.arrow_drop_down, color: Colors.black45),
              iconSize: 24,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: App_Color.formBackGroundColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }
}
