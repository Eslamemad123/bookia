import 'dart:developer';

import 'package:bookia/core/services/API/api_endPoints.dart';
import 'package:bookia/core/services/API/dio_provider.dart';
import 'package:bookia/core/services/local/LocalHelper.dart';
import 'package:bookia/features/profile/data/model/request/update_password_req.dart';
import 'package:bookia/features/profile/data/model/request/update_profile_req.dart';
import 'package:bookia/features/profile/data/model/response/order_history_response/order_history_response.dart';
import 'package:bookia/features/profile/data/model/response/profile_response/data.dart';
import 'package:bookia/features/profile/data/model/response/profile_response/profile_response.dart';

class Profile_Repo {
  static Future<bool?> updateProfile(UpdateProfileReq params) async {
    try {
      log('--- 1 ---');
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.updateProfile,
        data: params.toJson(),
        headers: {
          "Authorization": "Bearer ${Local_helper.getUserData()?.token}",
        },
      );
      log('--- 1 ---');

      if (res.statusCode == 200) {
        var data = ProfileResponse.fromJson(res.data);
        Local_helper.setProfileData(data.data);
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      log('${params.phone}');
    }
  }

  static Future<bool?> updatePassword(UpdatePasswordReq params) async {
    try {
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.updatePassword,
        data: params.toJson(),
        headers: {
          "Authorization": "Bearer ${Local_helper.getUserData()?.token}",
        },
      );
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static Future<bool?> deleteAccount(String params) async {
    try {
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.deleteAccount,
        data: {'current_password': params},
        headers: {
          "Authorization": "Bearer ${Local_helper.getUserData()?.token}",
        },
      );
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static Future<bool?> logOut() async {
    try {
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.logOut,
        headers: {
          "Authorization": "Bearer ${Local_helper.getUserData()?.token}",
        },
      );
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static Future<ProfileResponse?> showProfile() async {
    try {
      var res = await Dio_Provider.Get(
        endPoint: API_EndPoint.showProfile,
        headers: {
          "Authorization": "Bearer ${Local_helper.getUserData()?.token}",
        },
      );
      if (res.statusCode == 200) {
        var data = ProfileResponse.fromJson(res.data);
        Local_helper.setProfileData(data.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static Future<OrderHistoryResponse?> orderHistory() async {
    try {
      var res = await Dio_Provider.Get(
        endPoint: API_EndPoint.orderHistory,
        headers: {
          "Authorization": "Bearer ${Local_helper.getUserData()?.token}",
        },
      );
      if (res.statusCode == 200) {
        return OrderHistoryResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
