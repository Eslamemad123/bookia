import 'dart:developer';

import 'package:bookia/core/services/API/api_endPoints.dart';
import 'package:bookia/core/services/API/dio_provider.dart';
import 'package:bookia/core/services/local/LocalHelper.dart';
import 'package:bookia/features/WishList/Data/model/request/wishList_Request.dart';
import 'package:bookia/features/WishList/Data/model/response/wish_list_response/wish_list_response.dart';
import 'package:dio/dio.dart';

class WishList_Repo {
  static Future<WishListResponse?> addWishList(WishList_Request params) async {
    try {
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.AddWishList,
        data: params.toJson_WishList(),
        headers: {
          'Authorization': 'Bearer ${Local_helper.getUserData()?.token}',
        },
      );

      if (res.statusCode == 200) {
        var data = WishListResponse.fromJson(res.data);
        Local_helper.setWishList(data.data?.data);

        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<WishListResponse?> getWishList() async {
    try {
      var res = await Dio_Provider.Get(
        endPoint: API_EndPoint.GetWishList,
        headers: {
          'Authorization': 'Bearer ${Local_helper.getUserData()?.token}',
        },
      );

      if (res.statusCode == 200) {
        var data = WishListResponse.fromJson(res.data);
        Local_helper.setWishList(data.data?.data);

        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static Future<WishListResponse?> removeWishList(num id) async {
    try {
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.RemoveWishList,
        data: {'product_id': id},
        headers: {
          'Authorization': 'Bearer ${Local_helper.getUserData()?.token}',
        },
      );
      if (res.statusCode == 200) {
        var data = WishListResponse.fromJson(res.data);
        Local_helper.setWishList(data.data?.data);

        return data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.toString());
    }
  }
}
