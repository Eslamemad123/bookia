import 'dart:developer';

import 'package:bookia/core/services/local/LocalHelper.dart';
import 'package:bookia/features/profile/data/model/request/update_password_req.dart';
import 'package:bookia/features/profile/data/model/request/update_profile_req.dart';
import 'package:bookia/features/profile/data/model/response/faq_response/faq.dart';
import 'package:bookia/features/profile/data/model/response/order_history_response/order.dart';
import 'package:bookia/features/profile/data/model/response/profile_response/data.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile_Cubit extends Cubit<Profile_State> {
  Profile_Cubit() : super(ProfileInatial());

  TextEditingController FullName = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController NewPassword = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();
  TextEditingController CurrentPassword = TextEditingController();

  DataShowProfile? showProfileData;
  List<Order> orders = [];
  var updateProfileKey = GlobalKey<FormState>();
  var updatePasswordKey = GlobalKey<FormState>();
  var deleteAccountKey = GlobalKey<FormState>();

  updateProfile() async {
    emit(ProfileLoading());
    var params = UpdateProfileReq(
      name: FullName.text,
      address: Address.text,
      phone: Phone.text,
    );
    bool? res = await Profile_Repo.updateProfile(params);
    if (res ?? false) {
      emit(ProfileSuccess());
    } else {
      emit(ProfileError());
    }
  }

  Future showProfile() async {
    try {
      emit(ProfileLoading());
      //await Future.delayed(Duration(seconds: 1));
      var data = Local_helper.getProfileData();
     
      if (data != null) {
        showProfileData = data;
        emit(ProfileSuccess());
      } else {
        var res = await Profile_Repo.showProfile();
        if (res != null) {
          showProfileData = res.data;
          emit(ProfileSuccess());
        } else {
          emit(ProfileError());
        }
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  updatePassword() async {
    emit(ProfileLoading());
    var params = UpdatePasswordReq(
      currentPassword: CurrentPassword.text,
      newPassword: NewPassword.text,
      newPasswordConfirmation: ConfirmPassword.text,
    );
    bool? res = await Profile_Repo.updatePassword(params);

    if (res ?? false) {
      emit(ProfileSuccess());
    } else {
      emit(ProfileError());
    }
  }

  deleteAccount() async {
    emit(ProfileLoading());
    bool? res = await Profile_Repo.deleteAccount(CurrentPassword.text);
    if (res ?? false) {
      Local_helper.deleteUserData();
      Local_helper.remove(Local_helper.KProfile);

      emit(ProfileSuccess());
    } else {
      emit(ProfileError());
    }
  }

  logOut() async {
    emit(ProfileLoading());

    bool? res = await Profile_Repo.logOut();

    if (res ?? false) {
      Local_helper.deleteUserData();
      Local_helper.remove(Local_helper.KProfile);
      emit(LogOutSuccess());
    } else {
      emit(ProfileError());
    }
  }

  orderHistory() async {
    log('-- 1 ---');
    emit(ProfileLoading());
    log('-- 2 ---');

    var res = await Profile_Repo.orderHistory();
    log('-- 3 ---');

    if (res != null) {
      log('-- 4 ---');

      orders = res?.data?.orders ?? [];
      log('-- 5 ---${orders.length}   ${res?.data?.orders}');

      emit(ProfileSuccess());
    } else {
      log('-- 6 ---');

      emit(ProfileError());
    }
  }
}
