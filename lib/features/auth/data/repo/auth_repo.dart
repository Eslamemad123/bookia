import 'dart:developer';

import 'package:bookia/features/auth/data/models/request/auth_parms.dart';
import 'package:bookia/core/services/API/api_endPoints.dart';
import 'package:bookia/core/services/API/dio_provider.dart';
import 'package:bookia/features/auth/data/models/response/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/response/forgetPassResponse/forget_pass_response/forget_pass_response.dart';
import 'package:dio/dio.dart';

class Auth_Repo {
  static Future<AuthResponse?> login(AuthParams params) async {
    try {
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.login,
        data: params.tojson(),
      );
      if (res.statusCode == 200) {
        return AuthResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static Future<AuthResponse?> register(AuthParams params) async {
    try {
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.register,
        data: params.tojson(),
      );

      if (res.statusCode == 201) {
        return AuthResponse.fromJson(res.data);
        // Success
      } else {
        return null;
      }
    } on DioException catch (e) {
      log('Dio error: ${e.response?.statusCode}');
      log('Error data: ${e.response?.data}');
    } catch (e) {
      log('Unexpected error: $e');
    }
  }

  static Future<ForgetPassResponse?> forget_password(AuthParams params) async {
    try {
      log('--1--');
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.forgetPassword,
        data: params.tojson(),
      );
      log('--2--');

      if (res.statusCode == 200) {
        log('--3--');

        return ForgetPassResponse.fromJson(res.data);
      } else {
        log('--4--');

        return null;
      }
    } on Exception catch (e) {
      log('--5--');

      log(e.toString());
    }
  }

  static Future<ForgetPassResponse?> check_OTP(AuthParams params) async {
    try {
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.OTP,
        data: params.tojson(),
      );

      if (res.statusCode == 200) {
        return ForgetPassResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static Future<AuthResponse?> new_password(AuthParams params) async {
    try {
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.newPassword,
        data: params.tojson(),
      );
      if (res.statusCode == 200) {
        return AuthResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
