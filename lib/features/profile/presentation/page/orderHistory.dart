import 'dart:developer';

import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/services/local/LocalHelper.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/profile/data/model/response/order_history_response/order.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_Cubit.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Profile_Cubit()..orderHistory(),
      child: BlocBuilder<Profile_Cubit, Profile_State>(
        builder: (context, state) {
          var cubit = context.read<Profile_Cubit>();

          if (cubit.orders.isEmpty) {
            log('${Local_helper.getUserData()?.token}');

            return Scaffold(
                          appBar: App_Bar(leading: true, title: 'Order History'),

              body: Column(
                children: [
                  Lottie.asset(App_Assets.EmptyLottie),
                  Text(
                    'No Book In Wish List',
                    style: Text_Style.getText25(color: App_Color.goldPrimary),
                  ),
                ],
              ),
            );
          }
          return Scaffold(
            appBar: App_Bar(leading: true, title: 'Order History'),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Gap(20),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CardOrderHistory(order: cubit.orders[index]);
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 1,
                          color: App_Color.borderFormFiled,
                        );
                      },
                      itemCount: cubit.orders.length,
                    ),
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

class CardOrderHistory extends StatelessWidget {
  CardOrderHistory({super.key, required this.order});
  Order order;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 170,
      child: Container(
        decoration: BoxDecoration(
          color: App_Color.formBackGroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'order Number ${order.orderCode}',
                      style: Text_Style.getText18(),
                    ),
                    Text(
                      order.orderDate ?? '',
                      style: Text_Style.getText16(
                        color: App_Color.textgreyForm,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1, color: App_Color.formBackGroundColor),
              Row(
                children: [
                  Text('Total Amount', style: Text_Style.getText18()),
                  Text(
                    ' \$ ${order.total}',
                    style: Text_Style.getText18(color: App_Color.green),
                  ),
                ],
              ),
              Gap(20),
              Row(
                children: [
                  Text('State is ', style: Text_Style.getText18()),
                  Text(
                    ' ${order.status}',
                    style: Text_Style.getText18(color: App_Color.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
