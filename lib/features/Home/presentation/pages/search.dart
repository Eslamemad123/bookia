import 'dart:developer';

import 'package:bookia/components/app__bar.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:bookia/features/Home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/Home/presentation/cubit/homw_state.dart';
import 'package:bookia/features/Home/presentation/widget/card_all_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Search_Book extends StatelessWidget {
  Search_Book({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      
      create: (context) => Home_Cubit(),
      child: Scaffold(
        appBar: App_Bar(leading: true),
        body:  Builder(
          builder: (context) {
            var cubit =context.read<Home_Cubit>();
            return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Search Of Book',
                              hintStyle: TextStyle(color: App_Color.textgreyForm),
                              prefixIcon: Icon(
                                Icons.search,
                                color: App_Color.textgreydark,
                              ),
                              filled: true,
                              fillColor:
                                  App_Color
                                      .borderFormFiled, // background color for text field
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ), // rounded corners
                                borderSide: BorderSide.none, 
                                // no border
                              ),
                              
                            ),
                            controller: cubit.searchTitle,
                            onChanged: (value){
                              cubit.getSearchData(value);
                            },
                          ),
                        ),
                        BlocBuilder<Home_Cubit,Home_States>(
                          builder: (context,state) {
                                        if (state is HomeErrorState || state is HomeLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(color: App_Color.goldPrimary),
                  );
                }
                List<Product> product = cubit.Search;
                            return SizedBox(
                              width: double.infinity,
                              child: Expanded(
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
                              ),
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                );
          }
        )
          ,
        ),
      );
    
  }
}
