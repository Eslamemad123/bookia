import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/features/Home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/Home/presentation/cubit/homw_state.dart';
import 'package:bookia/features/Home/presentation/widget/all__products.dart';
import 'package:bookia/features/Home/presentation/widget/best__seller.dart';
import 'package:bookia/features/Home/presentation/widget/home__slider.dart';
import 'package:bookia/features/Home/presentation/widget/new__arrivals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Home_Cubit()..getHomeData(),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: App_Color.white,
          title: SvgPicture.asset(App_Assets.logoSVG, height: 30, width: 100),
          actions: [
            IconButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(App_Color.gold2),
              ),
              onPressed: () {
                pushTo(context, Routes.search);
              },
              icon: SvgPicture.asset(App_Assets.searchSVG),
            ),
          ],
        ),
        body: BlocBuilder<Home_Cubit, Home_States>(
          builder: (context, state) {
            var cubit = context.read<Home_Cubit>();

            if (state is HomeErrorState || state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(color: App_Color.goldPrimary),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Home_Slider(slider: cubit.Slider),
                    Gap(20),
                    Best_Seller(product: cubit.BestSaller),
                    Gap(20),
                    New_Arrive(product: cubit.BestSaller),
                    Gap(20),
                    All_Products(product: cubit.BestSaller),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
