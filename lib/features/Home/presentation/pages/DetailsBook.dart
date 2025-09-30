import 'dart:developer';

import 'package:bookia/components/app__bar.dart';
import 'package:bookia/components/mainButton.dart';
import 'package:bookia/core/extentions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:bookia/features/Home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/Home/presentation/cubit/homw_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class Details_Book extends StatefulWidget {
  Details_Book({super.key, required this.product, required this.title});
  Product product;
  String title;

  @override
  State<Details_Book> createState() => _Details_BookState();
}

class _Details_BookState extends State<Details_Book> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Home_Cubit(),
      child: BlocConsumer<Home_Cubit, Home_States>(
        listener: (context, state) {
          if (state is HomeLoadingState) {
            showLoadingBook(context);
          } else if (state is WishListCartSuccess) {
            context.pop();
          }
        },
        builder: (context, state) {
          var cubit = context.read<Home_Cubit>();
          final isInWishlist = cubit.isWishlist(widget.product.id ?? 0);

          return Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: App_Color.white,
              title: Text('Details Book', style: Text_Style.getText25()),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      cubit.addRemoveToWishList(widget.product.id ?? 0);
                    },
                    icon: SvgPicture.asset(
                      App_Assets.bookmarkSVG,
                      colorFilter: ColorFilter.mode(
                        isInWishlist ? App_Color.goldPrimary : App_Color.black1,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              leadingWidth: 75,
              leading: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: //SvgPicture.asset(App_Assets.backArrowSVG)
                    IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(App_Assets.backArrowSVG),
                ),
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${widget.product.price}',
                      style: Text_Style.getText25(),
                    ),
                    Gap(40),
                    Expanded(
                      child: Main_Button(
                        title:
                            cubit.isCart(widget.product.id ?? 0)
                                ? 'already exists in Cart'
                                : 'Add To Cart',
                        onPress:
                            cubit.isCart(widget.product.id ?? 0)
                                ? null
                                : () {
                                  cubit.addCart(widget.product.id ?? 0);
                                },
                        color: App_Color.black2,
                        height: 60,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: BlocConsumer<Home_Cubit, Home_States>(
              listener: (context, state) {
                if (state is WishListCartSuccess) {
                  show_Dialog(context, state.message, type: DialogType.success);
                } else if (state is HomeErrorState) {
                  show_Dialog(context, 'Error not add ');
                }
              },
              builder:
                  (context, state) => SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          Gap(30),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Hero(
                                tag: '${widget.product.id}_${widget.title}',
                                child: Image.network(
                                  widget.product.image ??
                                      'https://assets.tracegains.net/resources/img/global/no_image.jpg',
                                  height: 280,
                                ),
                              ),
                            ),
                          ),
                          Gap(25),
                          Text(
                            widget.product.name ?? '',
                            style: Text_Style.getText30(),
                          ),
                          Gap(15),

                          Text(
                            widget.product.category ?? '',
                            style: Text_Style.getText18(
                              color: App_Color.goldPrimary,
                            ),
                          ),
                          Gap(15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),

                            child: Text(
                              textAlign: TextAlign.justify,
                              widget.product.description ?? '',
                              style: Text_Style.getText14(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          );
        },
      ),
    );
  }
}
