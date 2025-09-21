import 'dart:developer';

import 'package:bookia/features/Home/data/Repo/home_repo.dart';
import 'package:bookia/features/Home/data/model/SliderResponse/slider_resbonse/slider.dart';
import 'package:bookia/features/Home/data/model/SliderResponse/slider_resbonse/slider_resbonse.dart';
import 'package:bookia/features/Home/data/model/books_response/books_response.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:bookia/features/Home/presentation/cubit/homw_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home_Cubit extends Cubit<Home_States> {
  Home_Cubit() : super(HomeInitailState());

  List<Product> NewArrivals = [];
  List<Product> BestSaller = [];
  List<Product> AllBooks = [];
  List<Slider_Model> Slider = [];
  List<Product> Search = [];

  bool searchFilter=false;

  double lowerValueSearch = 0;
  double upperValueSearch = 600;

  final TextEditingController searchTitle = TextEditingController();
  Future<void> getHomeData() async {
    emit(HomeLoadingState());

    try {
      var response = await Future.wait([
        Home_Repo.allBooks(),
        Home_Repo.bestSaller(),
        Home_Repo.newArrivails(),
        Home_Repo.getSlider(),
      ]);

      AllBooks = (response[0] as Books_Response).data?.products ?? [];
      BestSaller = (response[1] as Books_Response).data?.products ?? [];
      NewArrivals = (response[2] as Books_Response).data?.products ?? [];

      Slider = (response[3] as SliderResbonse).data?.sliders ?? [];

      emit(HomeSuccessState());
    } on Exception catch (e) {
      emit(HomeErrorState());
      log(e.toString());
    }
  }

  Future<void> getSearchData(String title) async {
    emit(HomeLoadingState());
    try {
      log('************* $lowerValueSearch   $upperValueSearch');

      var res = await Home_Repo.searchHome(
        title,
        upperValueSearch,
        lowerValueSearch,
      );
      if (res == null) {
      } else {}

      Search = (res as Books_Response).data?.products ?? [];
      emit(HomeSuccessState());
    } on Exception catch (e) {
      emit(HomeErrorState());
      log(e.toString());
    }
  }
}
