import 'dart:developer';

import 'package:bookia/core/services/local/LocalHelper.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:bookia/features/WishList/Data/Repo/wishList_repo.dart';
import 'package:bookia/features/WishList/Data/model/request/wishList_Request.dart';
import 'package:bookia/features/WishList/Data/model/response/wish_list_response/wish_list_response.dart';
import 'package:bookia/features/WishList/Presentation/cubit/wishList_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishList_cubit extends Cubit<wishList_State> {
  WishList_cubit() : super(wishListInatial());
  List<Product> wishListBooks = [];

  removeToWishList(num id) {
    emit(wishListLoading());
    var res = WishList_Repo.removeWishList(id).then((value) {
      if (value != null) {
        wishListBooks = value.data?.data ?? [];
        Local_helper.setWishList(wishListBooks);
        emit(wishListRemoveSuccess());
      } else {
        emit(wishListRemoveError());
      }
    });
  }

  getWishList() async {
    emit(wishListLoading());
    //var res = await WishList_Repo.getWishList();
   wishListBooks= Local_helper.getWishList()??[];
      emit(wishListSuccess());

    /*if (res != null) {
          wishListBooks = (res as WishListResponse).data?.data ?? [];

    } else {
      emit(wishListError());
    }*/
  }
}
