import 'dart:developer';

import 'package:bookia/components/app__bar.dart';
import 'package:bookia/core/utils/app%20assets.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/core/utils/textStyle.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:bookia/features/Home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/Home/presentation/cubit/homw_state.dart';
import 'package:bookia/features/Home/presentation/pages/search/widget/filter.dart';
import 'package:bookia/features/Home/presentation/pages/search/widget/slider_filter.dart';
import 'package:bookia/features/Home/presentation/pages/search/widget/text_form.dart';
import 'package:bookia/features/Home/presentation/widget/card_all_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:gap/gap.dart';

class Search_Book extends StatefulWidget {
  Search_Book({super.key});

  @override
  State<Search_Book> createState() => _Search_BookState();
}

class _Search_BookState extends State<Search_Book> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Home_Cubit(),
      child: Scaffold(
        appBar: App_Bar(leading: true),
        body: Builder(
          builder: (context) {
            var cubit = context.read<Home_Cubit>();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextForm(cubit: cubit),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      cubit.searchFilter = !cubit.searchFilter;
                                      if (!cubit.searchFilter) {
                                        cubit.upperValueSearch = 600;
                                        cubit.lowerValueSearch = 0;
                                        cubit.getSearchData(
                                          cubit.searchTitle.text,
                                        );
                                      }
                                    });
                                  },
                                  child: Filter(),
                                ),
                              ),
                            ],
                          ),
                          Gap(20),
                          (cubit.searchFilter)
                              ? SliderFilter(cubit: cubit)
                              : const SizedBox(), 
                        ],
                      ),
                    ),
                    BlocBuilder<Home_Cubit, Home_States>(
                      builder: (context, state) {
                        if (state is HomeErrorState ||
                            state is HomeLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: App_Color.goldPrimary,
                            ),
                          );
                        }
                        List<Product> product = cubit.Search;
                        return SizedBox(
                          width: double.infinity,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CardAllProduct(product: product[index]);
                            },
                            separatorBuilder: (context, index) => Gap(15),
                            itemCount: product.length,

                            scrollDirection: Axis.vertical,
                          ),
                        );
                      },
                    ),
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
