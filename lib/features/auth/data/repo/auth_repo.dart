import 'dart:developer';

import 'package:bookia/features/auth/data/models/request/auth_parms.dart';
import 'package:bookia/core/services/API/api_endPoints.dart';
import 'package:bookia/core/services/API/dio_provider.dart';
import 'package:bookia/features/auth/data/models/response/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/response/forgetPassResponse/forget_pass_response/forget_pass_response.dart';
import 'package:dio/dio.dart';

class Auth_Repo {
  static Future<dynamic?> login(AuthParams params) async {
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
    } on DioException catch (e) {
      ('Dio error: ${e.response?.statusCode}');
      if (e.response?.data['errors'] == null) {
        List<String> error = ['Validation Error'];

        return error;
      } else if (e.response?.data['errors']['email'] != null) {
        return e.response?.data['errors']['email'];
      } else if (e.response?.data['errors']['password'] != null) {
        return e.response?.data['errors']['password'];
      }
    } catch (e) {}
  }

  static Future<dynamic?> register(AuthParams params) async {
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
      ('Dio error: ${e.response?.statusCode}');
      if (e.response?.data['errors'] == null) {
        List<String> error = ['Validation Error'];

        return error;
      } else if (e.response?.data['errors']['email'] != null) {
        return e.response?.data['errors']['email'];
      } else if (e.response?.data['errors']['password'] != null) {
        return e.response?.data['errors']['password'];
      }
    } catch (e) {}
  }

  static Future<dynamic?> forget_password(AuthParams params) async {
    try {
      var res = await Dio_Provider.Post(
        endPoint: API_EndPoint.forgetPassword,
        data: params.tojson(),
      );

      if (res.statusCode == 200) {
        return ForgetPassResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      ('Dio error: ${e.response?.statusCode}');
      if (e.response?.data['errors'] == null) {
        List<String> error = ['Validation Error'];

        return error;
      } else if (e.response?.data['errors']['email'] != null) {
        return e.response?.data['errors']['email'];
      } else if (e.response?.data['errors']['password'] != null) {
        return e.response?.data['errors']['password'];
      }
    } catch (e) {}
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

  static Future<dynamic?> new_password(AuthParams params) async {
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
    } on DioException catch (e) {
      ('Dio error: ${e.response?.statusCode}');
      if (e.response?.data['errors'] == null) {
        List<String> error = ['Validation Error'];

        return error;
      } else if (e.response?.data['errors']['email'] != null) {
        return e.response?.data['errors']['email'];
      } else if (e.response?.data['errors']['password'] != null) {
        return e.response?.data['errors']['password'];
      }
    } catch (e) {}
  }
}
