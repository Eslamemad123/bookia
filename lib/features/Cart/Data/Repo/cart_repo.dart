import 'dart:developer';

import 'package:bookia/core/services/API/api_endPoints.dart';
import 'package:bookia/core/services/API/dio_provider.dart';
import 'package:bookia/core/services/local/LocalHelper.dart';
import 'package:bookia/features/Cart/Data/model/request/place_order_req.dart';
import 'package:bookia/features/Cart/Data/model/responce/cart_response/cart_response/cart_response.dart';
import 'package:dio/dio.dart';

class Cart_Repo {
  static Future<CartResponse?> addCart(num id) async {
    try {
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.AddCart,
        data: {'product_id': id},
        headers: {
          'Authorization': 'Bearer ${Local_helper.getUserData()?.token}',
        },
      );

      if (res.statusCode == 201) {
        var data = CartResponse.fromJson(res.data);
        Local_helper.setCart(data.data?.cartItem);

        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<CartResponse?> getCart() async {
    try {
      var res = await Dio_Provider.Get(
        endPoint: API_EndPoint.GetCart,
        headers: {
          'Authorization': 'Bearer ${Local_helper.getUserData()?.token}',
        },
      );

      if (res.statusCode == 200) {
        var data = CartResponse.fromJson(res.data);
        Local_helper.setCart(data.data?.cartItem);

        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static Future<CartResponse?> removeCart(num id) async {
    try {
      log('${Local_helper.getUserData()?.token}');
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.RemoveCart,
        data: {'cart_item_id': id},
        headers: {
          'Authorization': 'Bearer ${Local_helper.getUserData()?.token}',
        },
      );
      if (res.statusCode == 200) {
        var data = CartResponse.fromJson(res.data);
        Local_helper.setCart(data.data?.cartItem);

        return data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.toString());
    }
  }

  static Future<CartResponse?> updateCart(int id, int Quantity) async {
    try {
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.UpdateCart,
        data: {"cart_item_id": id, "quantity": Quantity},
        headers: {
          'Authorization': 'Bearer ${Local_helper.getUserData()?.token}',
        },
      );
      if (res.statusCode == 201) {
        var data = CartResponse.fromJson(res.data);
        Local_helper.setCart(data.data?.cartItem);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<bool?> checkOut() async {
    var res = await Dio_Provider.Get(
      endPoint: API_EndPoint.CheckOut,
      headers: {'Authorization': 'Bearer ${Local_helper.getUserData()?.token}'},
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool?> placeOrder(PlaceOrderReq params) async {
    try {
      log('PlaceOrder body: ${Local_helper.getUserData()?.token}');

      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.Placeorder,
        data: params.toJson(),
        headers: {
          "Authorization": "Bearer ${Local_helper.getUserData()?.token}",
        },
      );
      log('PlaceOrder body: ${params.toJson()}');

      if (res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      log("Error: ${e.response?.data}");
    }
  }
}
