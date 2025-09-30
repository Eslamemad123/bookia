import 'package:bookia/components/app__bar.dart';
import 'package:bookia/core/extentions/dialogs.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/WishList/Presentation/cubit/wishList_cubit.dart';
import 'package:bookia/features/WishList/Presentation/cubit/wishList_state.dart';
import 'package:bookia/features/WishList/Presentation/widget/card_wish_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class WishList_Screen extends StatelessWidget {
  WishList_Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishList_cubit()..getWishList(),
      child: Scaffold(
        appBar: App_Bar(title: 'WishList'),
        body: BlocConsumer<WishList_cubit, wishList_State>(
          listener: (context, state) {
            if (state is wishListRemoveSuccess) {
              show_Dialog(context, 'deleted success', type: DialogType.success);
            } else if (state is wishListRemoveError) {
              show_Dialog(context, 'filed delete!!');
            }
          },
          builder: (context, state) {
            var cubit = context.read<WishList_cubit>();
            if (state is wishListError || state is wishListLoading) {
              return Center(
                child: CircularProgressIndicator(color: App_Color.goldPrimary),
              );
            }
            if (cubit.wishListBooks.isEmpty) {
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
                Gap(50),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.wishListBooks.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Card_wishList(
                          product: cubit.wishListBooks[index],
                          onDelete: () {
                            context.read<WishList_cubit>().removeToWishList(
                              cubit.wishListBooks[index].id ?? 0,
                            );
                          },
                          onRefresh: () {
                            cubit.getWishList();
                          },
                        ),
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
