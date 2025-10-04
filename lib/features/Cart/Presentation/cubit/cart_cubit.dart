import 'dart:developer';

import 'package:bookia/core/services/local/LocalHelper.dart';
import 'package:bookia/features/Cart/Data/Repo/cart_repo.dart';
import 'package:bookia/features/Cart/Data/model/request/place_order_req.dart';
import 'package:bookia/features/Cart/Data/model/responce/cart_response/cart_response/cart_item.dart';
import 'package:bookia/features/Cart/Data/model/responce/cart_response/cart_response/cart_response.dart';
import 'package:bookia/features/Cart/Presentation/cubit/Cart_state.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart_cubit extends Cubit<Cart_State> {
  Cart_cubit() : super(CartInatial());
  List<CartItem> CartBooks = [];
  String TotalPrice = '0';

  var form_key = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var address = TextEditingController();
  int? governorate;
  inite() {
    var userData = Local_helper.getUserData()?.user;
    name.text = userData?.name ?? '';
    phone.text = userData?.phone ?? '';
    address.text = userData?.address ?? '';
    email.text = userData?.email ?? '';
    // governorate = userData?.city ?? 0;
  }

  removeToCart(num id) {
    emit(CartLoading());
    var res = Cart_Repo.removeCart(id).then((value) {
      if (value != null) {
        CartBooks = value.data?.cartItem ?? [];
        // Local_helper.setCart(CartBooks);
        emit(CartRemoveSuccess());
      } else {
        emit(CartRemoveError());
      }
    });
  }

  getCart() async {
    emit(CartLoading());
    TotalPrice = Local_helper.getString(Local_helper.KTotalCart) ?? '';
    if (Local_helper.getCart() != null) {
      CartBooks = Local_helper.getCart() ?? [];
      emit(CartSuccess());
    } else {
      var res = await Cart_Repo.getCart().then((value) {
        if (value != null) {
          TotalPrice = value?.data?.total ?? '0';
      emit(CartSuccess());

          //CartBooks = value.data?.cartItem ?? [];
        } else {
          emit(CartError());
        }
      });
    }
  }

  addToCart(num id) async {
    emit(CartLoading());

    var res = Cart_Repo.addCart(id).then((value) {
      if (value != null) {
        CartBooks = value.data?.cartItem ?? [];
        TotalPrice = value.data?.total ?? '0';

        emit(CartSuccess());
      } else {
        emit(CartError());
      }
    });
  }

  updateToCart(int id, int Quantity) async {
    emit(CartLoading());

    var res = Cart_Repo.updateCart(id, Quantity).then((value) {
      if (value != null) {
        CartBooks = value.data?.cartItem ?? [];
        TotalPrice = value.data?.total ?? '0';

        emit(CartSuccess());
      } else {
        emit(CartError());
      }
    });
  }

  chechOut() async {
    try {
      emit(LoadingCheckOut());
      bool res = await Cart_Repo.checkOut() ?? false;
      if (res) {
        emit(CheckoutSuccessState());
      } else {
        emit(CartError());
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  placeORder() async {
    try {
      emit(LoadingCheckOut());
      var params = PlaceOrderReq(
        address: address.text,
        email: email.text,
        name: name.text,
        phone: phone.text,
        governorateId: governorate,
      );
      bool res = await Cart_Repo.placeOrder(params) ?? false;
      if (res) {
        Local_helper.remove(Local_helper.KCart);
        emit(CheckoutSuccessState());
      } else {
        emit(CartError());
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
