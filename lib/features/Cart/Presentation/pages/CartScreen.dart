import 'dart:developer';

import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/services/local/LocalHelper.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/Cart/Presentation/cubit/Cart_state.dart';
import 'package:bookia/features/Cart/Presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/Cart/Presentation/widget/card_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class Cart_Screen extends StatelessWidget {
  Cart_Screen({super.key});
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Cart_cubit()..getCart(),
      child: Scaffold(
        appBar: App_Bar(title: 'Cart'),
        bottomNavigationBar: BlocConsumer<Cart_cubit, Cart_State>(
          listener: (context, state) {
            if (state is LoadingCheckOut) {
              isLoading = true;
            } else if (state is CheckoutSuccessState) {
              isLoading = false;
              pushTo(
                context,
                Routes.PlaceOrder,
                context.read<Cart_cubit>().TotalPrice,
              );
            }
          },
          builder: (context, state) {
            var cubit = context.read<Cart_cubit>();

            if (!context.read<Cart_cubit>().CartBooks.isEmpty) {
              return SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total After Discound :',
                            style: Text_Style.getText20(
                              color: App_Color.black3,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                '\$ ${context.read<Cart_cubit>().TotalPrice}',
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
                        radius: 4,
                        title: 'Checkout',
                        onPress: () {
                          cubit.chechOut();
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),

        body: BlocConsumer<Cart_cubit, Cart_State>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.read<Cart_cubit>();
            if (state is CartError || state is CartLoading) {
              return Center(
                child: CircularProgressIndicator(color: App_Color.goldPrimary),
              );
            }
            if (cubit.CartBooks.isEmpty) {
              log('${Local_helper.getUserData()?.token}');

              return Column(
                children: [
                  Lottie.asset(App_Assets.EmptyLottie),
                  Text(
                    'No Book In Wish List',
                    style: Text_Style.getText25(color: App_Color.goldPrimary),
                  ),
                ],
              );
            }
            return Column(
              children: [
                Gap(20),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.CartBooks.length,
                    itemBuilder: (context, index) {
                      return Card_Cart(
                        onUpdate: (Quantity) {
                          cubit.updateToCart(
                            (cubit.CartBooks[index].itemId ?? 0).toInt(),
                            Quantity.toInt(),
                          );
                        },
                        product: cubit.CartBooks[index],
                        onDelete: () {
                          context.read<Cart_cubit>().removeToCart(
                            cubit.CartBooks[index].itemId ?? 0,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
